import 'package:tipShake/routes/routes.dart';
import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:tipShake/utils/strings.dart';
import 'package:tipShake/widgets/button/primary_button_widget.dart';
import 'package:tipShake/widgets/input/input_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'package:get/utils.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);


  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final formKey = GlobalKey<FormState>();

  final typeController = TextEditingController();

  bool isLoading = true;

  List<String> typeList = ['Email-Address', 'Username'];
  late String selectedType;
  String type = 'email';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedType = typeList[0];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    typeController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        title: const Text(
          Strings.forgotPassword
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _headerWidget(context),
            SizedBox(height: Dimensions.heightSize * 2,),
            _inputWidget(context),
            _buttonWidget(context),
          ],
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
      child: Padding(
        padding: EdgeInsets.only(
          left: Dimensions.marginSize,
          right: Dimensions.marginSize
        ),
        child: InputTextFieldWidget(
          controller: typeController,
          title: Strings.email,
          hintText: Strings.enterEmail,
        ),
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimensions.marginSize,
          right: Dimensions.marginSize
      ),
      child: PrimaryButtonWidget(
          title: Strings.submit,
          onPressed: () {
            Get.toNamed(Routes.verifyScreen);
          }
      )
    );
  }

}
