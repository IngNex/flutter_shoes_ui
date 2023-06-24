import 'package:flutter/material.dart';

class ShakeTransition extends StatelessWidget {
  const ShakeTransition({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 700),
    this.offset = 140.0,
    this.axis = Axis.horizontal,
    this.left = true,
  }) : super(key: key);
  final Widget child;
  final Duration duration;
  final double offset;
  final Axis axis;
  final bool left;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 1.0, end: 0.0),
      child: child,
      curve: Curves.easeInOut,
      duration: duration,
      builder: (BuildContext context, double value, Widget? child) {
        return Transform.translate(
          offset: left
              ? Offset(-value * offset, value * offset)
              : Offset(value * offset, -value * -offset),
          child: child,
        );
      },
    );
  }
}
