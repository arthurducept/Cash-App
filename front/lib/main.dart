import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/style/themes.dart';
import 'package:front/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cash App',
      theme: ThemeData(
        scaffoldBackgroundColor: MyDarkTheme.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: MyDarkTheme.background,
        ),
        cardColor: MyDarkTheme.card,
      ),
      home: const HomeView(),
    );
  }
}
