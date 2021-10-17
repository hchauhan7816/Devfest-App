import 'package:devfest/Pages/agenda/agenda_page.dart';
import 'package:devfest/Pages/home/home_page.dart';
import 'package:devfest/controllers/theme_controller.dart';
import 'package:devfest/utils/themes.dart';
import 'package:devfest/utils/devfest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  await GetStorage.init();

  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  // SharedPreferences preferences = await SharedPreferences.getInstance();

  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  ThemeController themeController = Get.put(ThemeController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 2210),
      builder: () => GetMaterialApp(
        title: 'Google Devfest',
        debugShowCheckedModeBanner: Devfest.isDebugMode,
        theme: Themes().lightTheme,
        darkTheme: Themes().darkTheme,
        themeMode: themeController.getThemeMode(),
        home: HomePage(),
        getPages: [
          GetPage(name: '/home', page: () => HomePageBody()),
          GetPage(name: '/agenda', page: () => AgendaPage()), // Dynamic route
        ],
      ),
    );
  }
}
