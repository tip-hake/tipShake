import 'package:tipShake/routes/routes.dart';
import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:tipShake/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'drawer_item_widget.dart';

class MainDrawerWidget extends StatelessWidget {
  const MainDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          decoration: const BoxDecoration(
              color: CustomColor.bgColor
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                    top: Dimensions.heightSize * 2,
                    left: Dimensions.marginSize,
                    right: Dimensions.marginSize,
                    bottom: Dimensions.heightSize * 2,
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: GestureDetector(
                          child: Image.asset(
                            'assets/images/user.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                          onTap: () {
                            Get.toNamed(Routes.profileScreen);
                          },
                        ),
                      ),
                      SizedBox(height: Dimensions.heightSize * 0.5,),
                      Text(
                        'Jhon Doe',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimensions.largeTextSize,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  )
              ),
              DrawerItemWidget(
                title: Strings.exchange,
                iconPath: 'assets/svg/transfer_log.svg',
                onTap: () {
                  Get.toNamed(Routes.exchangeMoneyScreen);
                },
              ),
              DrawerItemWidget(
                title: Strings.deposit,
                iconPath: 'assets/svg/transfer_log.svg',
                onTap: () {
                  Get.toNamed(Routes.depositScreen);
                },
              ),
              DrawerItemWidget(
                title: Strings.depositLog,
                iconPath: 'assets/svg/pending.svg',
                onTap: () {
                  Get.toNamed(Routes.depositLogScreen);
                },
              ),
              DrawerItemWidget(
                title: Strings.withdraw,
                iconPath: 'assets/svg/transfer_log.svg',
                onTap: () {
                  Get.toNamed(Routes.withdrawScreen);
                },
              ),
              DrawerItemWidget(
                title: Strings.withdrawLog,
                iconPath: 'assets/svg/pending.svg',
                onTap: () {
                  Get.toNamed(Routes.withdrawLogScreen);
                },
              ),
              DrawerItemWidget(
                title: Strings.sendMoney,
                iconPath: 'assets/svg/transfer_log.svg',
                onTap: () {
                  Get.toNamed(Routes.sendMoneyScreen);
                },
              ),
              DrawerItemWidget(
                title: Strings.transferLog,
                iconPath: 'assets/svg/pending.svg',
                onTap: () {
                  Get.toNamed(Routes.transferLogScreen);
                },
              ),
              DrawerItemWidget(
                title: Strings.requestMoney,
                iconPath: 'assets/svg/transfer_log.svg',
                onTap: () {
                  Get.toNamed(Routes.requestMoneyScreen);
                },
              ),
              DrawerItemWidget(
                title: Strings.twoFA,
                iconPath: 'assets/svg/two_fa.svg',
                onTap: () {
                  Get.toNamed(Routes.twoFAScreen);
                },
              ),
              DrawerItemWidget(
                title: Strings.kyc,
                iconPath: 'assets/svg/kyc.svg',
                onTap: () {
                  Get.toNamed(Routes.kycVerificationScreen);
                },
              ),
              DrawerItemWidget(
                title: Strings.support,
                iconPath: 'assets/svg/support.svg',
                onTap: () {
                  Get.toNamed(Routes.supportScreen);
                },
              ),
              DrawerItemWidget(
                title: Strings.changePassword,
                iconPath: 'assets/svg/password.svg',
                onTap: () {
                  Get.toNamed(Routes.changePasswordScreen);
                },
              ),
              DrawerItemWidget(
                title: Strings.logout,
                iconPath: 'assets/svg/logout.svg',
                onTap: () {
                  Get.offAllNamed(Routes.loginScreen);
                },
              ),
            ],
          )),
    );
  }
}
