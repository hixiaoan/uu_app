

part of app_model;


class RankingModel {

  RankingModel({
    required this.total,
    required this.list
 });
  final int total;
  final List<VideoInfo> list;

 factory RankingModel.fromJson(Map<String, dynamic> json) =>RankingModel(
     total: json["total"],
     list: List<VideoInfo>.from(json["list"].map((x) => VideoInfo.fromJson(x)))
 );

}