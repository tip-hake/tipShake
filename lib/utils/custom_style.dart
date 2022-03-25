import 'package:flutter/material.dart';
import 'dimensions.dart';

class CustomStyle {
  static var textStyle = TextStyle(
      color: Colors.white,
      fontSize: Dimensions.largeTextSize,
    fontWeight: FontWeight.w600
  );

  static var updateTextStyle = TextStyle(
      color: Colors.white,
      fontSize: Dimensions.largeTextSize,
    fontWeight: FontWeight.bold
  );

  static var hintTextStyle = TextStyle(
      fontSize: Dimensions.defaultTextSize,
      fontWeight: FontWeight.w400,
    color: Colors.white.withOpacity(0.6)
  );

  static var listStyle = TextStyle(
    color: Colors.white,
    fontSize: Dimensions.defaultTextSize,
  );

  static var defaultStyle = TextStyle(
      color: Colors.white,
      fontSize: Dimensions.largeTextSize
  );
}