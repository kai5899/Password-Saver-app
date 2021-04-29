import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_saver/Configuration/Fonts.dart';
import 'package:password_saver/Configuration/Pallette.dart';
import 'package:password_saver/Controllers/DatabaseController.dart';
import 'package:password_saver/Widgets/HomePageWidgets/HomePageBody.dart';
import 'package:password_saver/Widgets/HomePageWidgets/HomePageUper.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen();
  final DatabaseController databaseController = Get.put(DatabaseController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: white,
          body: SlidingUpPanel(
            controller: databaseController.panelController,
            backdropColor: white,
            backdropEnabled: true,
            backdropOpacity: 0.8,
            maxHeight: Get.height * 0.75,
            minHeight: 0,
            onPanelOpened: () {
              databaseController.isPanelOpen.value = true;
            },
            onPanelClosed: () {
              databaseController.isPanelOpen.value = false;
            },
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(48),
              topLeft: Radius.circular(48),
            ),
            body: Column(
              children: [
                //Upper container
                HomePageUpper(),

                //cat section

                // HomePageCategorySection(databaseController.categories),
                SizedBox(
                  height: 10,
                ),

                HomePageBody()
              ],
            ),
            panelBuilder: (ScrollController sc) => Obx(() => databaseController
                .getPanel(databaseController.selectedPanel.value, sc)),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Obx(
            () => databaseController.isPanelOpen.value
                ? Container(
                    height: 0,
                  )
                : FloatingActionButton(
                    backgroundColor: color1,
                    onPressed: () {
                      // databaseController.panelController.open();
                      Get.dialog(
                        AlertDialog(
                          backgroundColor: color3.withOpacity(0.8),
                          title: Text("Select Action"),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                child: Center(
                                  child: Container(
                                    // width: Get.width * 0.3,
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                        color: color1,
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    child: Center(
                                      child: Text(
                                        "Add Category",
                                        style:
                                            montserratStyle(fontColor: white),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Get.back();
                                  databaseController.changeSelectedPanel(0);
                                  databaseController.panelController.open();
                                },
                              ),
                              SizedBox(
                                height: 19,
                              ),
                              GestureDetector(
                                child: Center(
                                  child: Container(
                                    // width: Get.width * 0.3,
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                        color: color1,
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    child: Center(
                                      child: Text(
                                        "Add Account",
                                        style:
                                            montserratStyle(fontColor: white),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Get.back();
                                  databaseController.changeSelectedPanel(1);
                                  databaseController.panelController.open();
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.add,
                      color: white,
                    ),
                  ),
          )),
    );
  }
}
