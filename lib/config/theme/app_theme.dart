import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
];

class AppTheme {
  final int selectedColor;

  new({required this.selectedColor})
    : assert(selectedColor >= 0, 'Selected color must be greater then 0');

    ThemeData getTheme() => ThemeData(
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: AppBarTheme(
        centerTitle: false,
      )
    );
}
