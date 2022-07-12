

part of widgets;

abstract class CustomToast {
  static void text(String text) {
    EasyLoading.instance
      ..maskType = EasyLoadingMaskType.clear
      ..userInteractions = true;
    EasyLoading.showToast(text);
  }

  static void success(String text) {
    EasyLoading.instance
      ..maskType = EasyLoadingMaskType.clear
      ..userInteractions = true;
    EasyLoading.showSuccess(text);
  }

  static void fail(String text) {
    EasyLoading.instance
      ..maskType = EasyLoadingMaskType.clear
      ..userInteractions = true;
    EasyLoading.showError(text);
  }

  static void loading() {
    EasyLoading.instance
      ..maskType = EasyLoadingMaskType.custom
      ..userInteractions = false;
    EasyLoading.show();
  }

  static void dismiss() => EasyLoading.dismiss();
}

class CustomToastFail extends StatelessWidget {
  const CustomToastFail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.close_rounded,
      color: const Color(0xFFFF1843),
      size: 60.w,
    );
  }
}

class CustomToastSuccess extends StatelessWidget {
  const CustomToastSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.check_rounded,
      color: Theme.of(context).colorScheme.primary,
      size: 60.w,
    );
  }
}
