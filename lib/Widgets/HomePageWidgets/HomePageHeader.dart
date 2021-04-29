import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_saver/Configuration/Fonts.dart';
import 'package:password_saver/Configuration/Pallette.dart';
import 'package:password_saver/Controllers/DatabaseController.dart';

class HomePageHeader extends StatelessWidget {
  HomePageHeader();
  final DatabaseController controller = Get.put(DatabaseController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.2,
      child: Row(
        children: [
          Container(
            height: Get.height * 0.2,
            width: Get.height * 0.17,
            decoration: BoxDecoration(
              color: color1,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(48),
              ),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 0,
                  color: color1.withOpacity(0.1),
                  offset: Offset(6.0, 6.0),
                  blurRadius: 16.0,
                ),
              ],
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(() {
                    return Text(
                      "${controller.totalPasswords}",
                      style: montserratStyle(fontColor: white, fontSize: 36),
                    );
                  }),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "passwords",
                    style: montserratStyle(
                      fontColor: white.withOpacity(0.8),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Hello\nMr Universe!",
                style:
                    montserratStyle(fontWeight: FontWeight.bold, fontSize: 30),
              )
            ],
          )
        ],
      ),
    );
  }
}
