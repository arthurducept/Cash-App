import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({Key? key, this.child, this.onTap, this.color,
    this.size = const Size.square(40)}) : super(key: key);

  final Widget? child;
  final Function()? onTap;
  final Color? color;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: size,
      child: ClipOval(
        child: Material(
          color: color,
          child: InkWell(
            onTap: onTap,
            child: child,
          ),
        ),
      ),
    );
  }
}