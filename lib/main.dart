import 'package:flutter/material.dart';
import 'package:project_1/custom_scroll_behavior.dart';
import 'package:project_1/pages/get_data/get_data_page.dart';
import 'package:project_1/util/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          foregroundColor: MyColors.lightColor,
          color: MyColors.primaryColor,
          actionsIconTheme: IconThemeData(
            color: MyColors.lightColor,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => MyColors.primaryColor),
          ),
        ),
      ),
      scrollBehavior: MyCustomScrollBehavior(),
      home: const GetDataPage(),
    );
  }
}
