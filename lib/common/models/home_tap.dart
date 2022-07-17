part of app_model;

class HomeTabModel {
  List<CategoryModel>? categoryList;

  HomeTabModel({this.categoryList});
  HomeTabModel.fromJson(Map<String, dynamic> json) {
    categoryList = List<CategoryModel>.from(
        json["categoryList"].map((x) => CategoryModel.fromJson(x)));
  }
}

class CategoryModel {
  CategoryModel({
    required this.name,
    required this.count,
  });

  String name;
  int count;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        name: json["name"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "count": count,
      };
}
