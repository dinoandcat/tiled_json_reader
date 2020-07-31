import 'package:tiledjsonreader/tile_set/tile_set_item.dart';

class TileSet {
  String name;
  double tileWidth;
  double tileHeight;
  double spacing;
  double margin;
  int tileCount;
  int columns;

  //objectalignment: Controls the alignment for tile objects. Valid values are unspecified, topleft, top, topright,
  // left, center, right, bottomleft, bottom and bottomright. The default value is unspecified, for compatibility
  // reasons. When unspecified, tile objects use bottomleft in orthogonal mode and bottom in isometric mode. (since 1.4)

  // 1.4version the image is an image object
  String image;
  double imageHeight;
  double imageWidth;
  String type;

  //Can contain at most one: <image>, <tileoffset>, <grid> (since 1.0), <properties>, <terraintypes>, <wangsets> (since 1.1),
  String tiledVersion;
  double version;

  List<TileSetItem> tiles;

  TileSet(
      {this.columns,
      this.image,
      this.imageHeight,
      this.imageWidth,
      this.margin,
      this.name,
      this.spacing,
      this.tileCount,
      this.tiledVersion,
      this.tileHeight,
      this.tiles,
      this.tileWidth,
      this.type,
      this.version});

  TileSet.fromJson(Map<String, dynamic> json) {
    columns = json['columns'];
    image = json['image'];
    imageHeight = double.parse(json['imageheight'].toString());
    imageWidth = double.parse(json['imagewidth'].toString());
    margin = double.parse(json['margin'].toString());
    name = json['name'];
    spacing = double.parse(json['spacing'].toString());
    tileCount = json['tilecount'];
    tiledVersion = json['tiledversion'];
    tileHeight = double.parse(json['tileheight'].toString());
    if (json['tiles'] != null) {
      tiles = new List<TileSetItem>();
      json['tiles'].forEach((v) {
        tiles.add(new TileSetItem.fromJson(v));
      });
    }
    tileWidth = double.parse(json['tilewidth'].toString());
    type = json['type'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['columns'] = this.columns;
    data['image'] = this.image;
    data['imageheight'] = this.imageHeight;
    data['imagewidth'] = this.imageWidth;
    data['margin'] = this.margin;
    data['name'] = this.name;
    data['spacing'] = this.spacing;
    data['tilecount'] = this.tileCount;
    data['tiledversion'] = this.tiledVersion;
    data['tileheight'] = this.tileHeight;
    if (this.tiles != null) {
      data['tiles'] = this.tiles.map((v) => v.toJson()).toList();
    }
    data['tilewidth'] = this.tileWidth;
    data['type'] = this.type;
    data['version'] = this.version;
    return data;
  }
}
