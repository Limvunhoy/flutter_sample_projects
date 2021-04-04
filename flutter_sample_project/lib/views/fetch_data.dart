import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_sample_project/models/user_model.dart';
import 'package:flutter_sample_project/views/photo_view.dart';
import 'package:http/http.dart' as http;

class FetchDataSample extends StatefulWidget {
  @override
  _FetchDataSampleState createState() => _FetchDataSampleState();
}

class _FetchDataSampleState extends State<FetchDataSample> {
  Future<List<UserResponse>> users;

  @override
  void initState() {
    super.initState();

    users = fetchUser();
  }

  Future<List<UserResponse>> fetchUser() async {
    String url = "https://jsonplaceholder.typicode.com/users";
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List userJson = json.decode(response.body);
      return userJson.map((e) => UserResponse.fromJson(e)).toList();
    } else {
      print("Fetch User Failed ");
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            title: Text("Fetch Data Sample"),
            backgroundColor: Colors.red.shade900),
        body: FutureBuilder(
            future: users,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return userCard(snapshot.data[index], () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PhotoView();
                        }));
                      });
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}

Widget userCard(UserResponse user, VoidCallback onTap) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Card(
      child: ListTile(
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://6.viki.io/image/43d3212eef0b430ab7c3325c3c5e00b4.jpeg?s=900x600&e=t"))),
            )),
        title: Text(
          user.username,
          style: TextStyle(height: 1.2),
        ),
        subtitle: Text(
          user.email,
          style: TextStyle(height: 1.2),
        ),
      ),
    ),
  );
}
