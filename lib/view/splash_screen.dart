import 'dart:async';
import 'package:tipShake/routes/routes.dart';
import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:tipShake/utils/strings.dart';
import 'package:tipShake/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}) : super(key: key);


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();

    _navigateScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [CustomColor.primaryColor, CustomColor.primaryColor]
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: Dimensions.marginSize,
            right: Dimensions.marginSize,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(Dimensions.radius * 2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Dimensions.radius * 2),
                      child: Image.asset(
                        "assets/images/icon.png",
                        width: 350.0,
                        height: 133.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.heightSize * 2,),
                  Text(
                    Strings.slogan,
                    textAlign:TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.extraLargeTextSize,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const CustomLoading(),
                  SizedBox(height: Dimensions.heightSize),
                  const Text(
                    "Version: ${Strings.appVersion}",
                    textAlign:TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _navigateScreen() {
    Timer(const Duration(seconds: 3),
            ()=>Get.offAllNamed(Routes.onboardScreen)
    );
  }
}
