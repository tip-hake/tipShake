import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:tipShake/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentPreviewWidget extends StatelessWidget {

  final String receiverMail, gatewayName, recipientWillGet, totalPayableAmount, charge;

  const PaymentPreviewWidget({Key? key, required this.receiverMail, required this.gatewayName, required this.recipientWillGet, required this.totalPayableAmount, required this.charge}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
      ),
      child: Column(
        children: [
          _itemWidget(
              context,
            'assets/svg/send_money.svg',
            Strings.receiver,
            receiverMail
          ),
          _itemWidget(
              context,
              'assets/svg/send_money.svg',
              Strings.gatewayName,
              gatewayName
          ),
          _itemWidget(
              context,
              'assets/svg/send_money.svg',
              Strings.recipientWillGet,
              recipientWillGet
          ),
          _itemWidget(
              context,
              'assets/svg/send_money.svg',
              Strings.charge,
              charge
          ),
          _itemWidget(
              context,
              'assets/svg/send_money.svg',
              Strings.totalPayableAmount,
              totalPayableAmount
          ),
        ],
      ),
    );
  }

  _itemWidget(BuildContext context, imagePath, title, subtitle,) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
                color: CustomColor.primaryColor.withOpacity(0.2)
            ),
            left: BorderSide(
                color: CustomColor.primaryColor.withOpacity(0.2)
            ),
            right: BorderSide(
                color: CustomColor.primaryColor.withOpacity(0.2)
            ),
          )
      ),
      child: Row(
        children: [
          Container(
            height: Dimensions.amountFieldHeight,
            width: Dimensions.amountFieldHeight,
            decoration: const BoxDecoration(
              color: CustomColor.secondaryColor,
            ),
            child: Padding(
              padding: EdgeInsets.all(Dimensions.radius * 1.25),
              child: SvgPicture.asset(
                'assets/svg/payment_history.svg',
                color: Colors.white54,
              ),
            ),
          ),
          SizedBox(width: Dimensions.widthSize,),
          Text(
            title,
            style: TextStyle(
                color: CustomColor.primaryColor.withOpacity(0.8),
                fontWeight: FontWeight.w400,
                fontSize: Dimensions.defaultTextSize
            ),
          ),
          const Spacer(),
          Text(
            subtitle,
            style: TextStyle(
                color: CustomColor.primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: Dimensions.defaultTextSize
            ),
          ),
          SizedBox(width: Dimensions.widthSize,),
        ],
      ),
    );
  }
}
