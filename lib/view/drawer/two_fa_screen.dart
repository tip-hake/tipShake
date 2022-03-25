import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tipShake/routes/routes.dart';
import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:tipShake/utils/strings.dart';
import 'package:tipShake/widgets/button/primary_button_widget.dart';
import 'package:tipShake/widgets/input/input_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TwoFAScreen extends StatefulWidget {
  const TwoFAScreen({Key? key}) : super(key: key);


  @override
  _TwoFAScreenState createState() => _TwoFAScreenState();
}

class _TwoFAScreenState extends State<TwoFAScreen> {

  final formKey = GlobalKey<FormState>();
  final codeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  void dispose() {
    // TODO: implement dispose
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        title: const Text(
            Strings.twoFA
        ),
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(height: Dimensions.marginSize,),
        _qrCodeWidget(context),
        SizedBox(height: Dimensions.marginSize * 2,),
        _inputWidget(context),
        _buttonWidget(context),
      ],
    );
  }

  _inputWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            InputTextFieldWidget(
              controller: codeController,
              title: Strings.verifyCode,
              hintText: Strings.enterVerificationCode,
              keyboardType: TextInputType.text,
            ),
          ],
        ),
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: PrimaryButtonWidget(
          title: Strings.verify,
          onPressed: () {
            Get.toNamed(Routes.paymentPreviewScreen);
          }
      ),
    );
  }

  _qrCodeWidget(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/qrcode.svg',
      height: 200.h,
      color: Colors.white,
    );
  }

}
