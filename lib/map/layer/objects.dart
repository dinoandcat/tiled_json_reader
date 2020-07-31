import 'package:tiledjsonreader/tile_set/polygon.dart';

class Objects {

  double height;
  int id;
  String name;
  int rotation;
  String type;
  bool visible;
  double width;
  double x;
  double y;
  int gid; // A reference to a tile. (optional)

  //TODO Can contain at most one: <properties>,<text> (since 1.0),<polyline>,

  // <ellipse> (since 0.9),
  bool ellipse;
  // <point> (since 1.1),
  bool point;
  // <polygon>,
  List<Polygon> polygon;

  Objects(
      {this.ellipse,
      this.point,
      this.height,
      this.id,
      this.name,
      this.rotation,
      this.type,
      this.visible,
      this.width,
      this.x,
      this.y,
      this.gid});

  Objects.fromJson(Map<String, dynamic> json) {
    height = double.parse(json['height'].toString());
    id = json['id'];
    name = json['name'];
    rotation = json['rotation'];
    type = json['type'];
    visible = json['visible'];
    width = double.parse(json['width'].toString());
    x = double.parse(json['x'].toString());
    y = double.parse(json['y'].toString());
    gid = json['gid'];
    ellipse = json['ellipse'] ?? false;
    point = json['point'] ?? false;
    if (json['polygon'] != null) {
      polygon = new List<Polygon>();
      json['polygon'].forEach((v) {
        polygon.add(new Polygon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['id'] = this.id;
    data['name'] = this.name;
    data['rotation'] = this.rotation;
    data['type'] = this.type;
    data['visible'] = this.visible;
    data['width'] = this.width;
    data['x'] = this.x;
    data['y'] = this.y;
    data['gid'] = this.gid;
    if (this.polygon != null) {
      data['polygon'] = this.polygon.map((v) => v.toJson()).toList();
    }
    data['ellipse']=this.ellipse;
    data['point']=this.point;
    return data;
  }
}
