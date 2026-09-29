import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.orange,
  Colors.cyan,
  Colors.blueGrey,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  new({this.selectedColor = 0, this.isDarkMode = false})
    : assert(selectedColor >= 0, 'Selected color must be greater then 0');

  ThemeData getTheme() => ThemeData(
    colorSchemeSeed: colorList[selectedColor],
    brightness: isDarkMode ? Brightness.light : Brightness.dark,
    appBarTheme: AppBarTheme(centerTitle: false),
  );

  AppTheme copyWith({int? selectedColor, bool? isDarkmode}) => AppTheme(
    selectedColor: selectedColor ?? this.selectedColor,
    isDarkMode: isDarkmode ?? this.isDarkMode,
  );
}
