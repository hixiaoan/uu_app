

part of request;

class CancelFavoriteRequest extends FavoriteRequest{

  @override
  HttpMethod httpMethod() {
    // TODO: implement httpMethod
    return HttpMethod.delete;
  }
}