import 'package:expenses/modules/home/home.dart';
import 'package:expenses/themes/app_colors.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: ThemeData(
          primaryColor: AppColors.primary,
          accentColor: AppColors.primary,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: AppColors.primary,
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: InputBorder.none,
          )),
    );
  }
}
