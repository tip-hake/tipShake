import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:tipShake/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'button/image_button_widget.dart';

class WalletWidget extends StatelessWidget {

  final double amount;
  final String currency, svgPath;
  final VoidCallback onPressedDeposit, onPressedWithdraw, onPressedExchange;

  const WalletWidget({Key? key, required this.amount, required this.currency, required this.svgPath, required this.onPressedDeposit, required this.onPressedWithdraw, required this.onPressedExchange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
        top: Dimensions.heightSize,
      ),
      child: Container(
        height: 160.h,
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius),
          gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [CustomColor.primaryColor, CustomColor.primaryColor, CustomColor.primaryColor],
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: Dimensions.heightSize * 2
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      svgPath,
                      height: 50.h,
                    ),
                    SizedBox(width: Dimensions.widthSize,),
                    Text(
                      '$amount ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Dimensions.extraLargeTextSize * 1.5,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      currency,
                      style: TextStyle(
                          color: CustomColor.accentColor,
                          fontSize: Dimensions.extraLargeTextSize * 1.5,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: Dimensions.heightSize,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageButtonWidget(
                      title: Strings.deposit,
                      imagePath: 'assets/icons/deposit.png',
                      onPressed: onPressedDeposit
                  ),
                  SizedBox(width: Dimensions.widthSize,),
                  ImageButtonWidget(
                      title: Strings.withdraw,
                      imagePath: 'assets/icons/request.png',
                      onPressed: onPressedWithdraw
                  ),
                  SizedBox(width: Dimensions.widthSize,),
                  ImageButtonWidget(
                      title: Strings.exchange,
                      imagePath: 'assets/icons/transfer.png',
                      onPressed: onPressedExchange
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
