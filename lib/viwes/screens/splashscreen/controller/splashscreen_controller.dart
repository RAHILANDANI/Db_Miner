import 'dart:async';
import 'package:adv_testsurpriser/module/helper/api_helper.dart';
import 'package:adv_testsurpriser/module/helper/database_helper.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    DataBaseHelper.databaseHelper.initDB();
    getdata().then(
      (value) => Get.offAllNamed('/'),
    );
  }

  Future getdata() async {
    await APIHelper.apiHelper.fetchedApiData();
  }
}
