

import 'package:flutter/material.dart';


class EmptyContainer extends StatefulWidget {
  final Widget child;
  final bool  isEmpty;
  const EmptyContainer({Key? key, required this.child, required this.isEmpty, }) : super(key: key);

  @override
  State<EmptyContainer> createState() => _EmptyContainerState();
}

class _EmptyContainerState extends State<EmptyContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildChidWidget()
    );
  }
  _buildChidWidget() {
    if (widget.isEmpty){
      return Center(
        child: Text("当前没有数"),
      );
    }else{
      return widget.child;
    }
  }
}
