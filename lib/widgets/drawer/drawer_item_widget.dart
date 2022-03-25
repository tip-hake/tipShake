import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DrawerItemWidget extends StatelessWidget {

  final String title;
  final String iconPath;
  final GestureTapCallback? onTap;

  const DrawerItemWidget({Key? key, required this.title, required this.iconPath, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: SvgPicture.asset(
          iconPath,
          color: Colors.white.withOpacity(0.8),
          height: 25.h,
        ),
        title: Text(
          title,
          style: const TextStyle(
              color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        onTap: onTap
        );
  }
}
