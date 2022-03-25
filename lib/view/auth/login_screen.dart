import 'package:tipShake/routes/routes.dart';
import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:tipShake/utils/strings.dart';
import 'package:tipShake/widgets/button/primary_button_widget.dart';
import 'package:tipShake/widgets/input/input_password_widget.dart';
import 'package:tipShake/widgets/input/input_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: Dimensions.marginSize,
            right: Dimensions.marginSize,
          ),
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(height: Dimensions.heightSize * 3),
              _headerWidget(context),
              SizedBox(height: Dimensions.heightSize * 2,),
              _inputWidget(context),
              _loginButtonWidget(context),
              SizedBox(height: Dimensions.heightSize),
              _forgotPasswordWidget(context),
              SizedBox(height: Dimensions.heightSize),
              _dontHaveAccountWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  _headerWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/icon.png',
          width: 200.w,
        ),
      ],
    );
  }

  _inputWidget(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          InputTextFieldWidget(
            controller: emailController,
            title: Strings.email,
            hintText: Strings.enterEmail,
          ),
          InputPasswordWidget(
            controller: passwordController,
            title: Strings.password,
            hintText: Strings.enterPassword,
          ),
        ],
      ),
    );
  }

  _loginButtonWidget(BuildContext context) {
    return PrimaryButtonWidget(
        title: Strings.login,
        onPressed: () {
          Get.offAllNamed(Routes.dashboardScreen);
          /*if(formKey.currentState!.validate()) {
            setState(() {
              // isLoading = false;
            });

          } else {
            print('field required');
          }*/
        }
    );
  }

  _forgotPasswordWidget(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        child: Text(
          '${Strings.forgotPassword}?',
          style: TextStyle(
              fontSize: Dimensions.largeTextSize,
              fontWeight: FontWeight.w600,
              color: CustomColor.accentColor
          ),
        ),
        onPressed: () {
          Get.toNamed(Routes.forgotPasswordScreen);
        },
      ),
    );
  }

  _dontHaveAccountWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Strings.dontHaveAnAccount,
          style: TextStyle(
              fontSize: Dimensions.largeTextSize,
              fontWeight: FontWeight.w400,
              color: CustomColor.secondaryColor
          ),
        ),
        TextButton(
          child: Text(
            Strings.register,
            style: TextStyle(
                fontSize: Dimensions.largeTextSize,
                fontWeight: FontWeight.w600,
                color: CustomColor.accentColor
            ),
          ),
          onPressed: () {
            Get.toNamed(Routes.registerScreen);
          },
        ),
      ],
    );
  }
}
