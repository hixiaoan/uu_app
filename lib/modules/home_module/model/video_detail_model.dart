


import 'dart:ffi';

import 'home_model.dart';

class VideoDetaiModel {
  VideoDetaiModel({
  required  this.isFavorite,
  required  this.isLike ,
  required  this.videoInfo,
  required  this.videoList,
  });

  bool isFavorite;
  bool isLike;
  VideoInfo videoInfo;
  List<VideoInfo> videoList;

  factory VideoDetaiModel.fromJson(Map<String, dynamic> json) => VideoDetaiModel(
    isFavorite: json["isFavorite"],
    isLike: json["isLike"],
    videoInfo: VideoInfo.fromJson(json["videoInfo"]),
    videoList: List<VideoInfo>.from(json["videoList"].map((x) => VideoInfo.fromJson(x))),
  );
}

class VideoInfo {
  VideoInfo({
    this.id,
    this.vid,
    this.title = "",
    this.tname,
    this.url,
    this.cover = "",
    this.pubdate,
    this.desc,
    this.view = 0,
    this.duration = 0,
    this.owner,
    this.reply,
    this.favorite = 0,
    this.like = 0,
    this.coin,
    this.share,
    this.createTime,
    this.size,
    this.isLike = false,
    this.isFavorite = false
  });

  String? id;
  String? vid;
  String title;
  String? tname;
  String? url;
  String cover;
  int? pubdate;
  String? desc;
  int view;
  int duration;
  Owner? owner;
  int? reply;
  int favorite;
  int like;
  int? coin;
  int? share;
  DateTime? createTime;
  int? size;
  ///是否喜欢
  bool isLike;
  bool isFavorite;
  factory VideoInfo.fromJson(Map<String, dynamic> json) => VideoInfo(
    id: json["id"],
    vid: json["vid"],
    title: json["title"],
    tname: json["tname"],
    url: json["url"],
    cover: json["cover"],
    pubdate: json["pubdate"],
    desc: json["desc"],
    view: json["view"],
    duration: json["duration"],
    owner: Owner.fromJson(json["owner"]),
    reply: json["reply"],
    favorite: json["favorite"],
    like: json["like"],
    coin: json["coin"],
    share: json["share"],
    createTime: DateTime.parse(json["createTime"]),
    size: json["size"],
  );
}


