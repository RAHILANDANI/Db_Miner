import 'package:adv_testsurpriser/viwes/screens/favouritepage/controller/favouritecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    FavouriteController favouriteController = Get.put(FavouriteController());
    favouriteController.getdata();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: GetBuilder<FavouriteController>(builder: (controller) {
        return Column(
          children: favouriteController.fetchdata
              .map((e) => Padding(
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
                              e.Name,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                            Text(
                              "Description - ${e.Description}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            Text(
                              "Link - ${e.Link}",
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
                                  onPressed: () {},
                                  icon: Icon(Icons.delete,
                                      color: Colors.white, size: 28),
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
                  ))
              .toList(),
        );
      }),
    );
  }
}