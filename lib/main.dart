import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '1_SplashScreen/loding.dart';
import 'language/langug.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: translation(),
      locale: Locale("ar"),
      fallbackLocale: Locale("ar"),
      home: Loding(),
    );
  }
}
