import 'package:flutter/material.dart';

class AppColor {
  static const Color color_white = Color(0xffFFFFFF);
  static const Color color_yellow = Color(0xffDDB130);
  static const Color color_grey = Colors.grey;
  static const Color color_divider = Colors.white38;
  static const Color color_purple = Colors.purpleAccent;
  static const Color color_trans = Colors.transparent;
  static const Color color_border_text_field = Color(0xffD6D6D6);
  static const Color color_error_text_field = Colors.red;

  static const LinearGradient gradient1 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF21294F),
      Color(0xFF4C3D98),
      Color(0xFF8A3D92),
    ],
  );

  static const LinearGradient gradientBottom = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF894DAA),
      Color(0xFF8C48A9),
      Color(0xFF953CA8),
    ],
  );


  static const LinearGradient gradientS2C = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF8A3D92),
      Color(0xFF343574),
    ],
  );

  static const LinearGradient gradientS3C1 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFA24794),
      Color(0xFF9E77CA),
    ],
  );

  static const LinearGradient gradientS3C2 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF513B9D),
      Color(0xFF9E77CA),
    ],
  );


  static const LinearGradient gradientS3CCenter= LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  colors: [
  Color(0xFFA55FA1),
  Color(0xFF2E2F92),
  ]);


}
















