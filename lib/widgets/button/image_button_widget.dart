import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageButtonWidget extends StatelessWidget {

  final String title;
  final String imagePath;
  final VoidCallback onPressed;

  const ImageButtonWidget({Key? key, required this.title, required this.imagePath, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.only(
          left: Dimensions.marginSize * 0.2,
          right: Dimensions.marginSize * 0.2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 14.w,
            ),
            SizedBox(width: Dimensions.widthSize * 0.5,),
            Text(
                title,
            ),
          ],
        ),
      ),
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor: MaterialStateProperty.all(CustomColor.accentColor.withOpacity(0.3)),
          side: MaterialStateProperty.all(BorderSide(
              color: Colors.white.withOpacity(0.5)
          )),
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(
                  vertical: 10.h
              )
          ),
          textStyle: MaterialStateProperty.all(
              TextStyle(
                  fontSize: Dimensions.smallTextSize,
              )
          )
      ),
    );
  }
}
