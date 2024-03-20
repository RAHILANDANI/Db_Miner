import 'package:adv_testsurpriser/module/helper/database_helper.dart';
import 'package:adv_testsurpriser/viwes/screens/favouritepage/model/favouritemodel.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  List<FavouriteModel> fetchdata = [];

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    getdata();
  }

  void getdata() async {
    List data = await DataBaseHelper.databaseHelper.fetchAllData();

    fetchdata = data
        .map((e) => FavouriteModel(
            Name: e['name'], Description: e['description']))
        .toList();
    update();
  }

  deleteData({required String link}) {
    DataBaseHelper.databaseHelper.deleteData(link: link);
    getdata();
  }
}
