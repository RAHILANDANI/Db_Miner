import 'package:adv_testsurpriser/module/helper/api_helper.dart';
import 'package:adv_testsurpriser/module/helper/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    bool isfavourite = false;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Quotes"),
            IconButton(
              onPressed: () {
                Get.toNamed('favourite');
              },
              icon: Icon(Icons.favorite_border),
            ),
          ],
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            },
            icon: Icon(Get.isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),
          SizedBox(
            width: 3,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            children: APIHelper.apiHelper.apidata
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.black.withOpacity(0.5),
                            Colors.black.withOpacity(1),
                          ],
                        ),
                      ),
                      height: 250,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.Auther,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                            Text(
                              "Quote - ${e.Content}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    DataBaseHelper.databaseHelper
                                        .insertfavourite(e.Auther, e.Content)
                                        .then((value) => isfavourite = true);
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.favorite,
                                      color: isfavourite == true
                                          ? Colors.red
                                          : Colors.white,
                                      size: 28),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Colors.white,
                                  size: 28,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList()),
      ),
    );
  }
}
//rahil
