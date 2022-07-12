part of http_dao;


class VideoDetailDao{

 static Future<VideoDetaiModel> requestVideoDetaiData(String videoId) async{
    VideoDetailRequest request = VideoDetailRequest();
    request.pathParams = videoId;
    var result = await HttpServices.instance.request(request);
    return VideoDetaiModel.fromJson(result["data"]);
  }

  ///收藏/取消收藏
  static Future<FavoriteModel> favoriteRequest(String videoId,{bool isFavoriteRequest = true}) async{
    BaseRequest request;
    if (isFavoriteRequest){
      request = FavoriteRequest();
    }else{
      request = CancelFavoriteRequest();
    }
    request.pathParams = videoId;
    var result = await HttpServices.instance.request(request);
    return FavoriteModel.formJson(result);
  }

  ///点赞/取消点赞
  static Future<FavoriteModel> kudosRequest(String vid,{isCancel = false}) async{
    BaseRequest request;
    if (!isCancel){
      request = KudosRequest();
    }else{
      request = CancelKudosRequest();
    }
    request.pathParams = vid;
    var result = await HttpServices.instance.request(request);
    return FavoriteModel.formJson(result);
  }
  }