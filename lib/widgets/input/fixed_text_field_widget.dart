import 'package:flutter/material.dart';
import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/custom_style.dart';
import 'package:tipShake/utils/dimensions.dart';

class FixedTextFieldWidget extends StatelessWidget {

  final String title;

  const FixedTextFieldWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: CustomColor.accentColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(Dimensions.radius * 0.3),
          border: Border.all(
            color: CustomColor.accentColor.withOpacity(0.6),
          )
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(
              left: Dimensions.marginSize * 0.8
          ),
          child: Text(
            title,
            style: CustomStyle.defaultStyle,
          ),
        ),
      ),
    );
  }
}
