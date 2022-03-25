import 'package:tipShake/routes/routes.dart';
import 'package:tipShake/utils/custom_color.dart';
import 'package:tipShake/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () => MaterialApp(
          title: Strings.appName,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: CustomColor.primaryColor,
              textTheme: GoogleFonts.comfortaaTextTheme(
                  Theme.of(context).textTheme
              ),
              appBarTheme: const AppBarTheme(
                  color: CustomColor.primaryColor
              )
          ),
          builder: (context, widget) {
            ScreenUtil.setContext(context);
            return MediaQuery(
              ///Setting font does not change with system font size
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: GetMaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    primaryColor: CustomColor.primaryColor,
                    textTheme: GoogleFonts.comfortaaTextTheme(
                        Theme.of(context).textTheme
                    ),
                    appBarTheme: const AppBarTheme(
                        color: CustomColor.primaryColor
                    )
                ),
                navigatorKey: Get.key,
                initialRoute: Routes.splashScreen,
                getPages: Routes.list,
              ),
            );
          },
        )
    );
  }
}

