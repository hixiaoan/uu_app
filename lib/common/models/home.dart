
part of app_model;


class HomeModel {
  HomeModel({
    this.bannerList,
    this.categoryList,
    this.videoList,
  });

  List<BannerList>? bannerList;
  List<CategoryList>? categoryList;
  List<VideoModel>? videoList;
  HomeModel.fromJson(Map<String, dynamic> json){
    if (json.containsKey('bannerList')){
      bannerList = List<BannerList>.from(json["bannerList"].map((x) => BannerList.fromJson(x)));
    }
    if (json.containsKey('categoryList')){
      categoryList = List<CategoryList>.from(json["categoryList"].map((x) => CategoryList.fromJson(x)));
    }
    if (json.containsKey("videoList")){
      videoList = List<VideoModel>.from(json["videoList"].map((x) => VideoModel.fromJson(x)));
    }
  }
}

class BannerList  extends BannerModel{
  BannerList({
    required this.id,
    required this.sticky,
    required this.type,
    required this.title,
    required this.subtitle,
    required this.url,
    required this.cover,
    required this.createTime,
  });

  String id = "";
  int sticky;
  String type;
  String title;
  String subtitle;
  String url;
  String cover;
  DateTime createTime;

  factory BannerList.fromJson(Map<String, dynamic> json) => BannerList(
    id: json["id"],
    sticky: json["sticky"],
    type: json["type"],
    title: json["title"],
    subtitle: json["subtitle"],
    url: json["url"],
    cover: json["cover"],
    createTime: DateTime.parse(json["createTime"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sticky": sticky,
    "type": type,
    "title": title,
    "subtitle": subtitle,
    "url": url,
    "cover": cover,
    "createTime": createTime.toIso8601String(),
  };

  @override
  String bannerTitle() {
    // TODO: implement bannerTitle
    return title;
  }

  @override
  String subTitle() {
    // TODO: implement subTitle
    return subtitle;
  }

  @override
  String jumpUrl() {
    // TODO: implement jumpUrl
   return "";
  }

  @override
  String bannerimageUrl() {
    // TODO: implement bannerimageUrl
    return cover;
  }
}

class CategoryList {
  CategoryList({
    required this.name,
    required this.count,
  });

  String name;
  int count;

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
    name: json["name"],
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "count": count,
  };
}

class VideoModel {
  VideoModel({
    required this.id,
    required this.vid,
    required this.title,
    required this.tname,
    required this.url,
    required this.cover,
    required this.pubdate,
    required this.desc,
    required this.view,
    required this.duration,
    required this.owner,
    required this.reply,
    required this.favorite,
    required this.like,
    required this.coin,
    required this.share,
    required this.createTime,
    required this.size,
  });

  String id;
  String vid;
  String title;
  String tname;
  String url;
  String cover;
  int pubdate;
  String desc;
  int view;
  int duration;
  Owner owner;
  int reply;
  int favorite;
  int like;
  int coin;
  int share;
  DateTime createTime;
  int size;

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
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

  Map<String, dynamic> toJson() => {
    "id": id,
    "vid": vid,
    "title": title,
    "tname": tname,
    "url": url,
    "cover": cover,
    "pubdate": pubdate,
    "desc": desc,
    "view": view,
    "duration": duration,
    "owner": owner.toJson(),
    "reply": reply,
    "favorite": favorite,
    "like": like,
    "coin": coin,
    "share": share,
    "createTime": createTime.toIso8601String(),
    "size": size,
  };
}

class Owner {
  Owner({
    required this.name,
    required this.face,
    required this.fans,
  });

  String name;
  String face;
  int fans;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    name: json["name"],
    face: json["face"],
    fans: json["fans"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "face": face,
    "fans": fans,
  };
}


