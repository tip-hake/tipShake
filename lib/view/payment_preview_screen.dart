import 'package:tipShake/dialog/custom_dialog.dart';
import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:tipShake/utils/strings.dart';
import 'package:tipShake/widgets/button/primary_button_widget.dart';
import 'package:tipShake/widgets/payment_preview_widget.dart';
import 'package:flutter/material.dart';


class PaymentPreviewScreen extends StatefulWidget {
  const PaymentPreviewScreen({Key? key}) : super(key: key);


  @override
  _PaymentPreviewScreenState createState() => _PaymentPreviewScreenState();
}

class _PaymentPreviewScreenState extends State<PaymentPreviewScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      appBar: AppBar(
        title: const Text(
            Strings.paymentPreview
        ),
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Stack(
      children: [
        _bgImageWidget(context),
        _previewWidget(context)
      ],
    );
  }

  _bgImageWidget(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(Dimensions.radius * 2),
        bottomRight: Radius.circular(Dimensions.radius * 2),
      ),
      child: Image.asset(
        'assets/images/onboard/3.png',
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.4,
        fit: BoxFit.fill,
      ),
    );
  }

  _previewWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const PaymentPreviewWidget(
          receiverMail: 'demo@gmail.com',
          gatewayName: 'Stripe',
          recipientWillGet: '\$470',
          totalPayableAmount: '\$500USD',
          charge: '\$30',
        ),
        SizedBox(height: Dimensions.heightSize * 2,),
        Padding(
            padding: EdgeInsets.only(
              left: Dimensions.marginSize,
              right: Dimensions.marginSize,
            ),
            child: PrimaryButtonWidget(
                title: Strings.confirm,
                onPressed: () {
                  CustomDialog.success(
                    Strings.yourPaymentIsSuccess
                  );
                }
            )
        )
      ],
    );
  }

}
