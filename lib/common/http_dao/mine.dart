part of http_dao;

class MineDao {

  static Future<PersonModel> requestData() async{

    MineRequest request = MineRequest();
    var result = await HttpServices.instance.request(request);
    return PersonModel.fromJson(result);
  }

}