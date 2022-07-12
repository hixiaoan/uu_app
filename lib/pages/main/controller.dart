part of main_page;

class MainController extends GetxController {
  late final PageController pageController;

  int currentPage = 0;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentPage);
  }

  void onPageChanged(int page) {
    currentPage = page;
    update(['navigation']);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
