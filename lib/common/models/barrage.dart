
//barrage_model.dart
part of app_model;

class BarrageModel {
  String content;
  String vid;
  int priority;
  int type;

  BarrageModel({this.content = "", this.vid= "", this.priority = 0, this.type = 0});

  factory BarrageModel.fromJson(Map<String, dynamic> json) => BarrageModel(
    content : json['content'],
    vid : json['vid'],
    priority : json['priority'],
    type : json['type'],
   );

  static List<BarrageModel> fromJsonString(json) {
    List<BarrageModel> list = [];
    if (!(json is String) || !json.startsWith('[')) {
      print('json is not invalid');
      return [];
    }

    var jsonArray = jsonDecode(json);
    jsonArray.forEach((v) {
      list.add(new BarrageModel.fromJson(v));
    });
    return list;
  }
}
