part of app_controller;

class HomeController extends GetxController with StateMixin<HomeTabModel> {
  final homeTabModels = HomeTabModel().obs;
  var currentName = "";
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    requestTabList();
  }

  void requestTabList() async {
    try {
      homeTabModels.value = await HomeDao.requestTabList();
      if (homeTabModels.value.categoryList!.isEmpty) {
        change(homeTabModels.value, status: RxStatus.empty());
      } else {
        change(homeTabModels.value, status: RxStatus.success());
      }
    } on NetError catch (e) {
      if (e is LoginError) {
        Get.toNamed(RouterName.Login);
      } else {
        change(null, status: RxStatus.error(e.message));
      }
    }
  }
}
