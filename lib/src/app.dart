import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int id = 0;
  List<ImageModel>images=[];
  void fetchImage() async {
    id++;
    var response = await get('https://jsonplaceholder.typicode.com/photos/$id');
    var imageModel=ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Let's See Images"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          tooltip: "Add Image",
          child: Icon(
            Icons.add,
            size: 40.0,
          ),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: ImageList(images),
        )
      ),
    );
  }
}
