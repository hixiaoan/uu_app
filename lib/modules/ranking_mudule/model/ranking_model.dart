

import '../../home_module/model/video_detail_model.dart';

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