import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample_project/provider/user_provider.dart';

void main() {
  runApp(ChangeNotifierProvider<UserProvider>(
    create: (_) => UserProvider(),
    child: MyApp(),
  ));
  // ChangeNotifierProvider<UserProvider>(
  //   builder: (context) => UserProvider(),
  //   child: MyApp(),
  // );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    final provider = Provider.of<UserProvider>(context, listen: false);
    provider.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            "Provider Sample Project",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red.shade900,
        ),
        body: userProvider.loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: userProvider.users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      userProvider.users[index].name,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(userProvider.users[index].email,
                        style: TextStyle(color: Colors.white)),
                  );
                }));
  }
}
