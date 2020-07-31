import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:tiledjsonreader/tile_set/tile_set_item.dart';
import 'package:tiledjsonreader/tiledjsonreader.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadMap,
        tooltip: 'Load',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _loadMap() {
//    TiledJsonReader tiled = TiledJsonReader('assets/mapa1.json');
    TiledJsonReader tiled = TiledJsonReader('assets/test_tileset.json');
    tiled.read().then((value) {

      log(jsonEncode(value).toString(), name: "load map");
      log("\n");
      log("\n");
      TileSetItem item = value.getTileByGID(244);
      TileSetItem item1 = value.getTileByGID(255);
      TileSetItem item2 = value.getTileByGID(250);
      log(jsonEncode(item.toJson()).toString(),name: "first");
      log(jsonEncode(item1.toJson()).toString(),name: "player");
      log(jsonEncode(item2.toJson()).toString(),name: "second");
    });
  }
}
