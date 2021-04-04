import 'package:flutter/material.dart';
import 'package:flutter_sample_project/models/photo_model.dart';
import 'package:flutter_sample_project/services/fetch_photo_service.dart';

class PhotoView extends StatefulWidget {
  PhotoView({Key key}) : super(key: key);

  @override
  _PhotoViewState createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoView> {
  FetchPhotoService service = FetchPhotoService();

  Future<List<PhotoResponse>> photos;

  @override
  void initState() {
    super.initState();

    photos = service.fetchPhoto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Photos"),
          backgroundColor: Colors.red.shade900,
        ),
        body: FutureBuilder( 
            future: photos,
            builder: (BuildContext context,
                AsyncSnapshot<List<PhotoResponse>> snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemCount: service.photos.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return Image.network(
                        snapshot.data[index].thumbnailUrl,
                        fit: BoxFit.cover,
                      );
                    });
              } else if (snapshot.hasError) {
                return Center(child: Text("Fetching Photo Failed"));
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
