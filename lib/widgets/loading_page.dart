


import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingContainer extends StatelessWidget {

  final Widget child;
  ///是否开始动画^
  final bool start;
  ///是否覆盖在界面之上
  final bool cover;

  const LoadingContainer(
      {Key? key,
      required this.child,
      required this.start,
      this.cover = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (cover){
      return Stack(
        children: [
          child,
          start ? _buildLoadingView():Container()
        ],
      );
    }
    return start ? _buildLoadingView():child;
  }

  _buildLoadingView() {
      ///lottie动画
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
          child: Lottie.asset("assets/loading.json",width: 200,height: 200))
    );
  }
}
