import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/custom_style.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:flutter/material.dart';

class ImageUploadWidget extends StatelessWidget {

  final Widget child;
  final String title;
  final GestureTapCallback onTap;

  const ImageUploadWidget({Key? key, required this.child, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
        bottom: Dimensions.heightSize,
      ),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
            border: Border.all(
              color: CustomColor.accentColor.withOpacity(0.6),
            )
          ),
          child: Column(
            children: [
              SizedBox(height: Dimensions.widthSize),
              child,
              Text(
                title,
                style: CustomStyle.textStyle,
              ),
              SizedBox(height: Dimensions.widthSize),
            ],
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
