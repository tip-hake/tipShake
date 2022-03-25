import 'dart:async';
import 'package:tipShake/routes/routes.dart';
import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:tipShake/utils/strings.dart';
import 'package:tipShake/widgets/button/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);


  @override
  _EmailVerificationScreenState createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  bool isLoading = true;
  String currentText = "";
  String arguments = "q@gmail.com";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        title: const Text(
            Strings.emailVerification
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: bodyWidget(context),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              top: Dimensions.heightSize
            ),
            child: SvgPicture.asset(
              "assets/svg/password.svg",
              width: 150.w,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: Dimensions.heightSize * 2,),
          Padding(
            padding: EdgeInsets.only(
              top: Dimensions.heightSize
            ),
            child: RichText(
              text: TextSpan(
                  text: '${Strings.enterOTPSentTo}: ',
                  children: [
                    TextSpan(
                        text: 'email@gmail.com',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.largeTextSize
                        )
                    ),
                  ],
                  style: TextStyle(
                      color: CustomColor.accentColor,
                      fontSize: Dimensions.largeTextSize
                  )
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.heightSize,
          ),
          Form(
            key: formKey,
            child: PinCodeTextField(
              appContext: context,
              backgroundColor: Colors.transparent,
              pastedTextStyle: TextStyle(
                color: Colors.orange.shade600,
                fontWeight: FontWeight.bold,
              ),
              length: 6,
              obscureText: true,
              obscuringCharacter: '*',
              obscuringWidget: const Icon(
                Icons.lock,
                size: 15,
              ),
              blinkWhenObscuring: true,
              animationType: AnimationType.fade,
              validator: (v) {
                if (v!.length < 3) {
                  return "I'm from validator";
                } else {
                  return null;
                }
              },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                inactiveFillColor: Colors.white,
                inactiveColor: Colors.black54,
                activeFillColor:
                hasError ? Colors.grey.shade100 : Colors.white,
              ),
              cursorColor: Colors.black,
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              errorAnimationController: errorController,
              controller: textEditingController,
              keyboardType: TextInputType.number,
              boxShadows: const [
                BoxShadow(
                  offset: Offset(0, 1),
                  color: Colors.black12,
                  blurRadius: 10,
                )
              ],
              onCompleted: (v) {

              },
              onChanged: (value) {
                setState(() {
                  currentText = value;
                });
              },
              beforeTextPaste: (text) {
                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                return true;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              hasError ? "*Please fill up all the cells properly" : "",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: Dimensions.smallTextSize,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: Dimensions.heightSize * 2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                Strings.didntGetOtpCode,
                style: TextStyle(
                    color: CustomColor.accentColor,
                    fontSize: Dimensions.defaultTextSize
                ),
              ),
              TextButton(
                  onPressed: () {

                  },
                  child: Text(
                    Strings.resend.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.defaultTextSize),
                  ))
            ],
          ),
          SizedBox(height: Dimensions.heightSize * 2,),
          PrimaryButtonWidget(
              title: Strings.verify,
              onPressed: () {
                Get.offAllNamed(Routes.dashboardScreen);
              }
          ),
        ],
      ),
    );
  }
}
