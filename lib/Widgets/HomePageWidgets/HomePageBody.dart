import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_saver/Controllers/DatabaseController.dart';
import 'package:password_saver/Widgets/HomePageWidgets/HomePageAccountsView.dart';

class HomePageBody extends StatelessWidget {
  HomePageBody();

  final DatabaseController databaseController = Get.put(DatabaseController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          // color: Color(0xffF9F6FB).withOpacity(0.7),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(60),
          ),
        ),
        child: HomePageAccounts(databaseController.accounts),
      ),
    );
  }
}
