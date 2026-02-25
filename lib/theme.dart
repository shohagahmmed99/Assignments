import 'dart:ui';

class AppThemeModel {
  final String image;
  final List<Color> oncolour;
  final List<Color> offcolour;
  final Color buttonIndicatorcolor;
  final Color bottomNavColor;
  final Color thumbColor;

  AppThemeModel(
      {required this.image,
      required this.oncolour,
      required this.offcolour,
      required this.buttonIndicatorcolor,
      required this.bottomNavColor,
      required this.thumbColor});
}
