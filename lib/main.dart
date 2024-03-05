import 'package:adv_testsurpriser/viwes/screens/favouritepage/favouritepage.dart';
import 'package:adv_testsurpriser/viwes/screens/homepage/homepage.dart';
import 'package:adv_testsurpriser/viwes/screens/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: "splash",
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/splash', page: () => const SplashSCreen()),
        GetPage(name: '/favourite', page: () => const Favourite()),
      ],
    ),
  );
}
