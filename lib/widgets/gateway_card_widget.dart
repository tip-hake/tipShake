import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GatewayCardWidget extends StatelessWidget {

  final String gatewayName, imagePath, buttonName;
  final VoidCallback onPressed;

  const GatewayCardWidget({Key? key, required this.gatewayName, required this.imagePath, required this.buttonName, required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColor.primaryColor.withOpacity(0.4),
      child: Column(
        children: [
          Container(
            height: 30.h,
            decoration: BoxDecoration(
                color: CustomColor.secondaryColor.withOpacity(0.2)
            ),
            child: Center(
              child: Text(
                gatewayName,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: Dimensions.heightSize * 0.5,),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: Dimensions.marginSize,
                right: Dimensions.marginSize,
              ),
              child: SvgPicture.asset(
                imagePath,
                height: 80.h,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: onPressed,
            child: Text(
                buttonName
            ),
            style: ElevatedButton.styleFrom(
              primary: CustomColor.primaryColor,
              onPrimary: CustomColor.accentColor,
              // minimumSize: Size(MediaQuery.of(context).size.width, 35)
            ),
          )
        ],
      ),
    );
  }
}
