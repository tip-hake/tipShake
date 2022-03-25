import 'package:tipShake/routes/routes.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:tipShake/utils/custom_color.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CustomDialog {
  static void success(String message) {
    Get.defaultDialog(
      title: '',
      backgroundColor: CustomColor.primaryColor,
      titleStyle: const TextStyle(color: Colors.white),
      middleTextStyle: const TextStyle(color: Colors.white),
      textConfirm: "OKAY",
      // textCancel: "Close",
      cancelTextColor: Colors.white,
      confirmTextColor: Colors.white,
      buttonColor: CustomColor.secondaryColor,
      barrierDismissible: true,
      radius: Dimensions.radius,
      onConfirm: () {
        Get.offAllNamed(Routes.dashboardScreen);
      },
      content: Column(
        children: [
          Image.asset(
            'assets/icons/success.png'
          ),
          SizedBox(height: Dimensions.heightSize * 2,),
          Text(
              message,
            style: TextStyle(
              fontSize: Dimensions.largeTextSize * 1.5,
              color: Colors.white,
              fontWeight: FontWeight.w500
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  static void error(String message) {
    Get.defaultDialog(
      title: '',
      backgroundColor: CustomColor.primaryColor,
      titleStyle: const TextStyle(color: Colors.white),
      middleTextStyle: const TextStyle(color: Colors.white),
      textConfirm: "OKAY",
      // textCancel: "Close",
      cancelTextColor: Colors.white,
      confirmTextColor: Colors.white,
      buttonColor: CustomColor.secondaryColor,
      barrierDismissible: true,
      radius: Dimensions.radius,
      onConfirm: () {
        Get.back();
      },
      content: Column(
        children: [
          Image.asset(
            'assets/icons/error.png'
          ),
          SizedBox(height: Dimensions.heightSize * 2,),
          Text(
              message,
            style: TextStyle(
              fontSize: Dimensions.largeTextSize * 1.5,
              color: Colors.white,
              fontWeight: FontWeight.w500
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
