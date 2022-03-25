import 'package:tipShake/data/gateway.dart';
import 'package:tipShake/routes/routes.dart';
import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/custom_style.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:tipShake/utils/strings.dart';
import 'package:tipShake/widgets/gateway_card_widget.dart';
import 'package:tipShake/widgets/input/input_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({Key? key}) : super(key: key);

  @override
  _WithdrawScreenState createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {

  final amountController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        title: const Text(
            Strings.withdraw
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimensions.heightSize * 0.5
      ),
      child: GridView.builder(
          itemCount: GatewayList.list().length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
          ),
          itemBuilder: (context, index) {
            final gateway = GatewayList.list()[index];
            return GatewayCardWidget(
                gatewayName: '${gateway.name} - ${gateway.currency}',
                imagePath: gateway.svgPath,
                buttonName: Strings.withdraw,
                onPressed: () {
                  _inputAmountDialog(context);
                }
            );
          }

      ),
    );
  }

  void _inputAmountDialog(BuildContext context) {
    Get.defaultDialog(
      title: "Payment by CoinPayments - BTC",
      backgroundColor: CustomColor.primaryColor,
      titleStyle: const TextStyle(color: Colors.white),
      middleTextStyle: const TextStyle(color: Colors.white),
      textConfirm: "Confirm",
      textCancel: "Close",
      cancelTextColor: Colors.white,
      confirmTextColor: CustomColor.primaryColor,
      buttonColor: CustomColor.accentColor,
      barrierDismissible: true,
      radius: Dimensions.radius,
      onConfirm: () {
        Get.toNamed(Routes.paymentPreviewScreen);
      },
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              Text(
                'Limit: ',
                style: CustomStyle.defaultStyle,
              ),
              Text(
                '1.00 - 100 USD',
                style: CustomStyle.textStyle,
              ),
            ],
          ),
          Wrap(
            children: [
              Text(
                'Charge: ',
                style: CustomStyle.defaultStyle,
              ),
              Text(
                '1.00 + 10%',
                style: CustomStyle.textStyle,
              ),
            ],
          ),
          SizedBox(height: Dimensions.heightSize,),
          InputTextFieldWidget(
              controller: amountController,
              title: Strings.amount,
              hintText: Strings.enterAmount,
            keyboardType: TextInputType.number,
          )
        ],
      ),
    );
  }

}
