import 'package:tipShake/routes/routes.dart';
import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:tipShake/utils/strings.dart';
import 'package:tipShake/widgets/button/primary_button_widget.dart';
import 'package:tipShake/widgets/input/input_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatefulWidget {

  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  final formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isLoading = true;

  @override
  void dispose() {
    // TODO: implement dispose
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        title: const Text(
          Strings.resetPassword
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 24.w
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(height: Dimensions.heightSize * 2,),
              _headerWidget(context),
              SizedBox(height: Dimensions.heightSize * 2,),
              _inputWidget(context),
              _buttonWidget(context),
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
          InputPasswordWidget(
            controller: passwordController,
            title: Strings.newPassword,
            hintText: Strings.enterNewPassword,
          ),
          InputPasswordWidget(
            controller: confirmPasswordController,
            title: Strings.confirmPassword,
            hintText: Strings.enterConfirmPassword,
          ),
        ],
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return PrimaryButtonWidget(
        title: Strings.changePassword,
        onPressed: () {
          Get.offAllNamed(Routes.loginScreen);
        }
    );
  }

}
