import 'package:tipShake/utils/custom_color.dart';
import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return const CircularProgressIndicator(
      valueColor:  AlwaysStoppedAnimation<Color>(CustomColor.accentColor),
    );
  }
}
