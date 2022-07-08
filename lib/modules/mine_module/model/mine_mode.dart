

// To parse this JSON data, do
//
//     final personModel = personModelFromJson(jsonString);

import 'dart:convert';

import '../../home_module/model/home_model.dart';

class PersonModel {
  PersonModel({
   required this.code,
   required this.data,
   required this.msg,
  });

  int code;
  UserModel data;
  String msg;

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
    code: json["code"],
    data: UserModel.fromJson(json["data"]),
    msg: json["msg"],
  );
}

class UserModel {
  UserModel({
    this.name = '',
    this.face = '',
    this.fans = 0,
    this.favorite = 0,
    this.like = 0,
    this.coin = 0,
    this.browsing = 0,
    this.bannerList ,
    this.courseList,
    this.benefitList,
  });

  String name;
  String face;
  int fans;
  int favorite;
  int like;
  int coin;
  int browsing;
  List<BannerList>? bannerList;
  List<CourseList>? courseList;
  List<BenefitList>? benefitList;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json["name"],
    face: json["face"],
    fans: json["fans"],
    favorite: json["favorite"],
    like: json["like"],
    coin: json["coin"],
    browsing: json["browsing"],
    bannerList: List<BannerList>.from(json["bannerList"].map((x) => BannerList.fromJson(x))),
    courseList: List<CourseList>.from(json["courseList"].map((x) => CourseList.fromJson(x))),
    benefitList: List<BenefitList>.from(json["benefitList"].map((x) => BenefitList.fromJson(x))),
  );

}

class BenefitList {
  BenefitList({
    this.name = '',
    this.url = '',
  });

  String name;
  String url;

  factory BenefitList.fromJson(Map<String, dynamic> json) => BenefitList(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}

class CourseList {
  CourseList({
    this.name = '',
    this.cover = '',
    this.url = '',
    this.group = 0,
  });

  String name;
  String cover;
  String url;
  int group;

  factory CourseList.fromJson(Map<String, dynamic> json) => CourseList(
    name: json["name"],
    cover: json["cover"],
    url: json["url"],
    group: json["group"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "cover": cover,
    "url": url,
    "group": group,
  };
}
