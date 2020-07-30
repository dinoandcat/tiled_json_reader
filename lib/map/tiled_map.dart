import 'package:tiledjsonreader/map/layer/map_layer.dart';
import 'package:tiledjsonreader/map/layer/object_group.dart';
import 'package:tiledjsonreader/map/layer/tile_layer.dart';
import 'package:tiledjsonreader/map/layer/type_layer.dart';
import 'package:tiledjsonreader/map/tile_set_detail.dart';
import 'package:tiledjsonreader/util/extensions.dart';

class TiledMap {
  double version;
  String tiledVersion;
  String orientation;
  String renderOrder;
  int compressionLevel;
  int width;
  int height;
  int tileWidth;
  int tileHeight;
  //hexsidelength: Only for hexagonal maps. Determines the width or height (depending on the staggered axis) of the tile’s edge, in pixels.
  //staggeraxis: For staggered and hexagonal maps, determines which axis (“x” or “y”) is staggered. (since 0.11)
  //staggerindex: For staggered and hexagonal maps, determines whether the “even” or “odd” indexes along the staggered axis are shifted. (since 0.11)
  //backgroundcolor: The background color of the map. (optional, may include alpha value since 0.15 in the form #AARRGGBB. Defaults to fully transparent.)
  int nextLayerId;
  int nextObjectId;
  bool infinite;
  //Can contain at most one: <properties>

  List<TileSetDetail> tileSets;
  List<MapLayer> layers;
  String type;
  //TODO Can contain any number:  <objectgroup>, <imagelayer>, <group> (since 1.0), <editorsettings> (since 1.3)
  TiledMap(
      {this.compressionLevel,
      this.height,
      this.infinite,
      this.layers,
      this.nextLayerId,
      this.nextObjectId,
      this.orientation,
      this.renderOrder,
      this.tiledVersion,
      this.tileHeight,
      this.tileSets,
      this.tileWidth,
      this.type,
      this.version,
      this.width});

  TiledMap.fromJson(Map<String, dynamic> json) {
    compressionLevel = json['compressionlevel'];
    height = json['height'];
    infinite = json['infinite'];
    if (json['layers'] != null) {
      layers = new List<MapLayer>();
      json['layers'].forEach((v) {
        if (v['type'] == TypeLayer.tilelayer.getName()) {
          layers.add(TileLayer.fromJson(v));
        } else if (v['type'] == TypeLayer.objectgroup.getName()) {
          layers.add(ObjectGroup.fromJson(v));
        } else {
          layers.add(MapLayer.fromJson(v));
        }
      });
    }
    nextLayerId = json['nextlayerid'];
    nextObjectId = json['nextobjectid'];
    orientation = json['orientation'];
    renderOrder = json['renderorder'];
    tiledVersion = json['tiledversion'];
    tileHeight = json['tileheight'];
    if (json['tilesets'] != null) {
      tileSets = new List<TileSetDetail>();
      json['tilesets'].forEach((v) {
        tileSets.add(new TileSetDetail.fromJson(v));
      });
    }
    tileWidth = json['tilewidth'];
    type = json['type'];
    version = json['version'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['compressionlevel'] = this.compressionLevel;
    data['height'] = this.height;
    data['infinite'] = this.infinite;
    if (this.layers != null) {
      data['layers'] = this.layers.map((v) => v.toJson()).toList();
    }
    data['nextlayerid'] = this.nextLayerId;
    data['nextobjectid'] = this.nextObjectId;
    data['orientation'] = this.orientation;
    data['renderorder'] = this.renderOrder;
    data['tiledversion'] = this.tiledVersion;
    data['tileheight'] = this.tileHeight;
    if (this.tileSets != null) {
      data['tilesets'] = this.tileSets.map((v) => v.toJson()).toList();
    }
    data['tilewidth'] = this.tileWidth;
    data['type'] = this.type;
    data['version'] = this.version;
    data['width'] = this.width;
    return data;
  }
}
