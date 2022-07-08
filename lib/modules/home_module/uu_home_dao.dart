


import 'package:uu_app/modules/home_module/model/favorite_model.dart';
import 'package:uu_app/modules/home_module/model/home_model.dart';
import 'package:uu_app/modules/home_module/model/video_detail_model.dart';
import 'package:uu_app/modules/home_module/request/cancel_favorite_request.dart';
import 'package:uu_app/modules/home_module/request/candel_kudos_request.dart';
import 'package:uu_app/modules/home_module/request/favorite_request.dart';
import 'package:uu_app/modules/home_module/request/home_request.dart';
import 'package:uu_app/modules/home_module/request/kudos_request.dart';
import 'package:uu_app/modules/home_module/request/video_detail_request.dart';
import 'package:uu_app/uu_http_services/core/uu_http.dart';
import 'package:uu_app/uu_http_services/request/base_request.dart';


class UUHomeDao{

  static requestData( String categoryName,{int pageIndex = 1,int pageSize = 10,Function()? avtion}) async{
      UUHomeRequest request = UUHomeRequest();
      request
        .addRequestParams("pageIndex", pageIndex)
        .addRequestParams("pageSize", pageSize);
      request.pathParams = categoryName;
      print("header:${request.header}");
      var result = await UUHttpServices.getInstance().request(request);
      return HomeModel.fromJson(result["data"]);
  }

  static Future<VideoDetaiModel> requestVideoDetaiData(String videoId) async{
    VideoDetailRequest request = VideoDetailRequest();
    request.pathParams = videoId;
    var result = await UUHttpServices.getInstance().request(request);
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
    var result = await UUHttpServices.getInstance().request(request);
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
    var result = await UUHttpServices.getInstance().request(request);
    return FavoriteModel.formJson(result);
  }
}