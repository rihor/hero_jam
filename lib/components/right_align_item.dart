import 'package:flutter/material.dart';

class RightAlignItem extends StatelessWidget {
  final Widget child;

  const RightAlignItem({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(),
        ),
        child,
      ],
    );
  }
}
