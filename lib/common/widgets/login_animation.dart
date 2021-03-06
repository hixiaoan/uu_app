part of widgets;

class LoginAnimationWidget<T extends LoginController > extends StatelessWidget {
  final T controller;
  const LoginAnimationWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: Colors.grey[100],
            border: const Border(bottom: BorderSide(color: Colors.grey))),
        child: GetBuilder<T>(
          init: controller,
          builder: (vc) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                vc.passwordState
                    ? "assets/images/head_left_protect.png"
                    : "assets/images/head_left.png",
                width: 100,
                fit: BoxFit.cover,
              ),
              Image.asset(
                "assets/images/logo.png",
                width: 100,
                fit: BoxFit.cover,
              ),
              Image.asset(
                vc.passwordState
                    ? "assets/images/head_right_protect.png"
                    : "assets/images/head_right.png",
                width: 100,
                fit: BoxFit.cover,
              )
            ],
          ),
        ));
  }
}
