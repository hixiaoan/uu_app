
part of request;
class CancelKudosRequest extends KudosRequest{

  @override
  HttpMethod httpMethod() {
    // TODO: implement httpMethod
    return HttpMethod.delete;
  }
}