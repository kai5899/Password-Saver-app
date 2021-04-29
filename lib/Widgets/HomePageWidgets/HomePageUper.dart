import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_saver/Configuration/Pallette.dart';
import 'package:password_saver/Widgets/HomePageWidgets/HomePagePassGenerator.dart';

import 'HomePageHeader.dart';

class HomePageUpper extends StatelessWidget {
  HomePageUpper();
  final double height = Get.height * 0.40;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      alignment: Alignment.topCenter,
      child: Container(
        height: height,
        width: Get.width,
        decoration: BoxDecoration(
          color: color1.withOpacity(0.1),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(75),
          ),
        ),
        child: Column(
          children: [
            HomePageHeader(),
            SizedBox(
              height: height * 0.05,
            ),
            HomePagePassGenerator()
          ],
        ),
      ),
    );
  }
}
