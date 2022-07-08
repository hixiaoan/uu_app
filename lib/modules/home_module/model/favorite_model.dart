

class FavoriteModel{


  FavoriteModel({
    required this.code,
    required this.msg

  });

  final int code;
  final String msg;

  factory FavoriteModel.formJson(Map<String,dynamic> json) =>FavoriteModel(
    code : json["code"],
    msg : json["msg"],
    );
}