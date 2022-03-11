import 'package:flutter/material.dart';

class MyDarkTheme {
  static const Color background = Color(0xFF0F0F10);
  static const Color card = Color(0xFF2D2D31);
  static const Color primaryText = Color(0xFFFFFFFF);
  static const Color secondaryText = Color(0xB3FFFFFF);
  static const Color success = Color(0xE67DD680);
  static const Color link = Color(0xFF50AEFF);
  static const Color bottomNavigationBar = Color(0xFF4B4C50); // Blur effect
  static const Color modalBackground = Color(0xFF1F1F21);
  static const Color cardLight = Color(0xFF45454B);
  static const Color chip = Color(0x3DFFFFFF);
  static const Color buttonBackground = Color(0xFF48484A);

  static const TextStyle appBarTitle = TextStyle(
      color: primaryText,
      fontSize: 18,
      fontWeight: FontWeight.bold
  );
  static const TextStyle appBarSubtitle = TextStyle(
    color: secondaryText,
    fontSize: 14,
  );
  static const TextStyle title = TextStyle(
      color: primaryText,
      fontSize: 24,
      fontWeight: FontWeight.bold
  );
  static const TextStyle inputText = TextStyle(
    color: primaryText,
    fontSize: 14,
  );
  static const TextStyle inputHint = TextStyle(
    color: chip,
    fontSize: 14,
  );
  static const TextStyle listTitle = TextStyle(
      color: primaryText,
      fontSize: 14,
      fontWeight: FontWeight.bold
  );
  static const TextStyle listAction = TextStyle(
      color: primaryText,
      fontSize: 14,
      fontWeight: FontWeight.bold
  );
  static const TextStyle listSubtitle = TextStyle(
    color: secondaryText,
    fontSize: 12,
  );
  static const TextStyle cardAmount = TextStyle(
    color: primaryText,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle bottomItemTitle = TextStyle(
    color: primaryText,
    fontSize: 10,
  );
  static const TextStyle textLink = TextStyle(
    color: link,
    fontSize: 16,
  );
}