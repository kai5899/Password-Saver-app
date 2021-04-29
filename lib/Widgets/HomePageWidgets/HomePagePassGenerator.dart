import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:password_saver/Configuration/Fonts.dart';
import 'package:password_saver/Configuration/Pallette.dart';
import 'package:password_saver/Controllers/DatabaseController.dart';

class HomePagePassGenerator extends StatelessWidget {
  HomePagePassGenerator();
  final DatabaseController controller = Get.put(DatabaseController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              child: Row(
                children: [
                  Text(
                    "Generate new password",
                    textAlign: TextAlign.start,
                    style: montserratStyle(),
                  ),
                ],
              ),
              padding: EdgeInsets.fromLTRB(35, 0, 16, 10),
            ),
            Container(
              height: 70,
              margin: EdgeInsets.fromLTRB(32, 0, 32, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: color10,
                boxShadow: [
                  BoxShadow(
                      color: color10.withOpacity(0.9),
                      offset: Offset(-4.0, -4.0),
                      blurRadius: 16.0,
                      spreadRadius: 1),
                  BoxShadow(
                    spreadRadius: 0,
                    color: color10.withOpacity(0.1),
                    offset: Offset(6.0, 6.0),
                    blurRadius: 16.0,
                  ),
                ],
              ),
              child: Center(
                child: ListTile(
                  leading: GestureDetector(
                    child: Icon(
                      Icons.copy,
                      color: color3,
                    ),
                    onTap: () {
                      Clipboard.setData(new ClipboardData(
                          text: controller.generatedPasswordController.text));

                      Get.showSnackbar(GetBar(
                        message:
                            "the password ${controller.generatedPasswordController.text} can be used now",
                        title: "Password copied to clipboard",
                        snackPosition: SnackPosition.TOP,
                        duration: Duration(seconds: 1, milliseconds: 500),
                        borderRadius: 25,
                        backgroundColor: color7,
                        overlayBlur: 24,
                      ));
                    },
                  ),
                  title: TextFormField(
                    enabled: false,
                    controller: controller.generatedPasswordController,
                    decoration: InputDecoration(
                        // icon: GestureDetector(
                        //   child: Icon(
                        //     Icons.copy,
                        //     color: color3,
                        //   ),
                        //   onTap: () {
                        //     Clipboard.setData(new ClipboardData(
                        //         text: controller
                        //             .generatedPasswordController.text));
                        //   },
                        // ),
                        hintText: "click the lock to generate",
                        border: InputBorder.none),
                  ),
                  trailing: GestureDetector(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: color1),
                      child: Center(
                        child: Icon(
                          Icons.lock,
                          color: white,
                        ),
                      ),
                    ),
                    onTap: () {
                      controller.updateRandomString();
                    },
                    onDoubleTap: () {
                      controller.generatedPasswordController.clear();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
