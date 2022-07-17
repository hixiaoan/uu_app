part of bindings;

class RegisterBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LoginController(), tag: "register");
    Get.lazyPut(() => RegisterController());
  }
}
