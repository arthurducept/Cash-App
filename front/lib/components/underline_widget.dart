import 'package:flutter/material.dart';
import 'package:front/style/themes.dart';

class UnderlineWidget extends StatelessWidget {
  const UnderlineWidget({Key? key, this.textLength = 0, this.size = 7.0}) : super(key: key);

  final int textLength;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3.0,
      width: textLength * size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: MyDarkTheme.primaryText,
      ),
    );
  }
}