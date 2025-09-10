import 'package:flutter/material.dart';

class FontUtils {
  static const String _fontFamily = 'Roboto';
  // static const String _fontFamily = 'AguafinaScript';

  // Regular font style
  static TextStyle regular({double size = 14, Color color = Colors.black}) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: size,
      color: color,
    );
  }

  // Bold font style
  static TextStyle bold({double size = 14, Color color = Colors.black}) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: size,
      color: color,
    );
  }

  // Semi-bold example
  static TextStyle semiBold({double size = 14, Color color = Colors.black}) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: size,
      color: color,
    );
  }

  // italic example
  static TextStyle italic({double size = 14, Color color = Colors.black}) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: size,
      fontStyle: FontStyle.italic,
      color: color,
    );
  }
  // light example
  static TextStyle light({double size = 14, Color color = Colors.black}) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w300,
      fontSize: size,
      color: color,
    );
  }
}
