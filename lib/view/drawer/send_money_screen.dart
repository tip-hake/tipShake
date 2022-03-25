import 'package:tipShake/routes/routes.dart';
import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:tipShake/utils/strings.dart';
import 'package:tipShake/widgets/button/primary_button_widget.dart';
import 'package:tipShake/widgets/input/input_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({Key? key}) : super(key: key);


  @override
  _SendMoneyScreenState createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {

  final formKey = GlobalKey<FormState>();
  final receiverMailController = TextEditingController();
  final amountController = TextEditingController();
  final remarksController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  void dispose() {
    // TODO: implement dispose
    receiverMailController.dispose();
    amountController.dispose();
    remarksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        title: const Text(
            Strings.sendMoney
        ),
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
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
        top: Dimensions.heightSize,
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            InputTextFieldWidget(
              controller: receiverMailController,
              title: Strings.receiverMail,
              hintText: Strings.enterEmail,
              keyboardType: TextInputType.emailAddress,
            ),
            InputTextFieldWidget(
              controller: amountController,
              title: Strings.amount,
              hintText: Strings.enterAmount,
              keyboardType: TextInputType.number,
            ),
            InputTextFieldWidget(
              controller: remarksController,
              title: Strings.remarks,
              hintText: Strings.enterRemarks,
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
          title: Strings.send,
          onPressed: () {
            Get.toNamed(Routes.paymentPreviewScreen);
          }
      ),
    );
  }

}
