import 'package:flutter/material.dart';
import 'package:front/style/themes.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem({Key? key, this.icon, this.title, this.onTap
  }) : super(key: key);

  final IconData? icon;
  final String? title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: MyDarkTheme.primaryText, size: 32),
            const SizedBox(height: 11,),
            Text(title ?? '', style: MyDarkTheme.bottomItemTitle,),
          ],
        ),
      ),
    );
  }
}