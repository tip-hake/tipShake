import 'package:tipShake/routes/routes.dart';
import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/dimensions.dart';
import 'package:tipShake/utils/strings.dart';
import 'package:tipShake/widgets/button/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {

  int totalPages = OnBoardingItemList.loadOnboardItem().length;
  late int next;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: CustomColor.primaryColor,
          body: PageView.builder(
            itemCount: totalPages,
            itemBuilder: (context, index) {
              OnBoardingItem onBoardingItem = OnBoardingItemList.loadOnboardItem()[index];
              next = index;
              return Stack(
                children:[
                  _imageWidget(context, onBoardingItem),
                  _contentWidget(context, onBoardingItem)
                ],
              );
            },
          ),
      ),
    );
  }

  _imageWidget(BuildContext context, OnBoardingItem onBoardingItem) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(Dimensions.radius * 3),
        bottomRight: Radius.circular(Dimensions.radius * 3),
      ),
      child: Image.asset(
        onBoardingItem.image!,
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  _contentWidget(BuildContext context, OnBoardingItem onBoardingItem) {
    return Positioned(
      bottom: Dimensions.heightSize,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: Dimensions.marginSize,
              right: Dimensions.marginSize,
            ),
            child: Text(
              onBoardingItem.title!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Dimensions.extraLargeTextSize * 1.2,
                color: Colors.white
              ),
            ),
          ),
          SizedBox(height: Dimensions.heightSize),
          Padding(
            padding: EdgeInsets.only(
              left: Dimensions.marginSize,
              right: Dimensions.marginSize,
            ),
            child: Text(
              onBoardingItem.subTitle!,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                fontSize: Dimensions.defaultTextSize,
              ),
            ),
          ),
          const SizedBox(height: 30.00),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Align(
              alignment: Alignment.center,
              child: next != (totalPages - 1) ? Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: SizedBox(
                  width: 100.0,
                  height: 10.0,
                  child: ListView.builder(
                    itemCount: totalPages,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i){
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          width: next == i ? 30 : 20.0,
                          decoration: BoxDecoration(
                              color: next == i ? CustomColor.accentColor :
                              CustomColor.accentColor.withOpacity(0.4),
                              borderRadius: const BorderRadius.all(Radius.circular(10.0))
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
                  : Padding(
                padding: EdgeInsets.only(
                  left: Dimensions.marginSize,
                  right: Dimensions.marginSize,
                ),
                child: PrimaryButtonWidget(
                  title: Strings.finish,
                  onPressed: () {
                    _goToScreen(context);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _goToScreen(BuildContext context) async {
    Get.offAllNamed(Routes.loginScreen);
  }
}
