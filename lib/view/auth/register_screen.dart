import 'package:tipShake/routes/routes.dart';
import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:tipShake/utils/strings.dart';
import 'package:tipShake/widgets/button/primary_button_widget.dart';
import 'package:tipShake/widgets/input/input_password_widget.dart';
import 'package:tipShake/widgets/input/input_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final zipController = TextEditingController();
  final cityController = TextEditingController();
  final countryController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    zipController.dispose();
    cityController.dispose();
    countryController.dispose();
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
          Strings.register
        ),
      ),
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
              SizedBox(height: Dimensions.heightSize),
              // _headerWidget(context),
              // SizedBox(height: Dimensions.heightSize * 2,),
              _inputWidget(context),
              _registerButtonWidget(context),
              SizedBox(height: Dimensions.heightSize),
              _alreadyHaveAccountWidget(context),
            ],
          ),
        ),
      ),
    );
  }

  _inputWidget(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          InputTextFieldWidget(
            controller: fullNameController,
            title: Strings.fullName,
            hintText: Strings.enterFullName,
          ),
          InputTextFieldWidget(
            controller: emailController,
            title: Strings.email,
            hintText: Strings.enterEmail,
            keyboardType: TextInputType.emailAddress,
          ),
          InputTextFieldWidget(
            controller: phoneController,
            title: Strings.phoneNumber,
            hintText: Strings.enterPhoneNumber,
            keyboardType: TextInputType.number,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: InputTextFieldWidget(
                  controller: addressController,
                  title: Strings.address,
                  hintText: Strings.enterAddress,
                ),
              ),
              SizedBox(width: Dimensions.widthSize,),
              Expanded(
                flex: 1,
                child: InputTextFieldWidget(
                  controller: zipController,
                  title: Strings.zip,
                  hintText: Strings.enterZip,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: InputTextFieldWidget(
                  controller: cityController,
                  title: Strings.city,
                  hintText: Strings.enterCity,
                ),
              ),
              SizedBox(width: Dimensions.widthSize,),
              Expanded(
                flex: 1,
                child: InputTextFieldWidget(
                  controller: countryController,
                  title: Strings.country,
                  hintText: Strings.enterCountry,
                ),
              ),
            ],
          ),
          InputPasswordWidget(
            controller: passwordController,
            title: Strings.password,
            hintText: Strings.enterPassword,
          ),
          InputPasswordWidget(
            controller: passwordController,
            title: Strings.confirmPassword,
            hintText: Strings.enterConfirmPassword,
          ),
        ],
      ),
    );
  }

  _registerButtonWidget(BuildContext context) {
    return PrimaryButtonWidget(
        title: Strings.register,
        onPressed: () {
          Get.toNamed(Routes.emailVerificationScreen);
        }
    );
  }

  _alreadyHaveAccountWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Strings.alreadyHaveAnAccount,
          style: TextStyle(
              fontSize: Dimensions.largeTextSize,
              fontWeight: FontWeight.w400,
              color: CustomColor.secondaryColor
          ),
        ),
        TextButton(
          child: Text(
            Strings.login,
            style: TextStyle(
                fontSize: Dimensions.largeTextSize,
                fontWeight: FontWeight.w600,
                color: CustomColor.accentColor
            ),
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    );
  }
}
