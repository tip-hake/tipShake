import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButtonWidget extends StatelessWidget {

  final String title;
  final VoidCallback onPressed;

  const PrimaryButtonWidget({Key? key, required this.title, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(CustomColor.accentColor),
            foregroundColor: MaterialStateProperty.all(CustomColor.primaryColor),
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(
                    vertical: 14.h
                )
            ),
            textStyle: MaterialStateProperty.all(
                TextStyle(
                    fontSize: Dimensions.defaultTextSize.sp,
                    fontWeight: FontWeight.w700
                )
            )
        ),
      ),
    );
  }
}
