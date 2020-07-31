library tiledjsonreader;

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tiledjsonreader/map/tiled_map.dart';
import 'package:tiledjsonreader/tile_set/tile_set.dart';

class TiledJsonReader {
  final String pathFile;
  String _basePathFile;
  String _fileName;
  TiledMap _map;

  TiledJsonReader(this.pathFile) {
    _fileName = pathFile.split('/').last;
    if (!_fileName.contains('.json')) {
      throw Exception('only supports json files');
    }
    _basePathFile = pathFile.replaceAll(_fileName, '');
  }

  Future<TiledMap> read() async {
    String data = await rootBundle.loadString(pathFile);
    Map<String, dynamic> _result = jsonDecode(data);
    TiledMap _map = TiledMap.fromJson(_result);
    List<dynamic> _tileSetsResults = _result["tilesets"];
    // the tileset can embed in the map, when  this selected the tileset's source will be null
    for (var i = 0; i < _map.tileSets.length; i++) {
      await Future.sync(() async {
        if (_map.tileSets[i].source == null) {
          _map.tileSets[i].tileSet = TileSet.fromJson(_tileSetsResults[i]);
        } else if (!_map.tileSets[i].source.contains('.json')) {
          throw Exception('Invalid TileSet source: only supports json files');
        } else {
          data = await rootBundle.loadString('$_basePathFile${_map.tileSets[i].source}');
          if (data != null) {
            Map<String, dynamic> _result = jsonDecode(data);
            _map.tileSets[i].tileSet = TileSet.fromJson(_result);
          }
        }
      });
    }

    return Future.value(_map);
  }
}
