import 'package:flutter/material.dart';

class AnimatedSizedBox extends AnimatedWidget {
  const AnimatedSizedBox({
    Key? key,
    required AnimationController controller,
  }) : super(key: key, listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _progress.value,
    );
  }
}
