import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int counter=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Let's See Images"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>setState(
                  ()=>counter++
          ),
          tooltip: "Add Image",
          child: Icon(Icons.add,size: 40.0,),
        ),
        body: Center(
          child: Text("$counter images"),
        ),
      ),
    );
  }
}
