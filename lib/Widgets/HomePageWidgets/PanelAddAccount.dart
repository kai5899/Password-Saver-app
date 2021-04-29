import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_saver/Configuration/Fonts.dart';
import 'package:password_saver/Configuration/Pallette.dart';
import 'package:password_saver/Controllers/DatabaseController.dart';
import 'package:password_saver/Widgets/CustomTextField.dart';
import 'package:password_saver/Widgets/PanelWidgets/CategorySelection.dart';
import 'package:password_saver/Widgets/PanelWidgets/IconSelection.dart';

class PanelAddAccount extends StatelessWidget {
  PanelAddAccount({this.sc});
  final ScrollController sc;

  final DatabaseController databaseController = Get.put(DatabaseController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        controller: sc,
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              height: 10,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(12)),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Add New Account",
                style: montserratStyle(
                    fontColor: color5,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),

          //title provider
          SizedBox(
            height: Get.height * 0.03,
          ),

          CustomTextField(
            title: "Site , App or Provider",
            icon: Icons.web,
            controller: databaseController.accountTitleController,
          ),

          IconSelection(),

          //auth
          SizedBox(
            height: Get.height * 0.03,
          ),
          CustomTextField(
            title: "Email , Username or Phone",
            controller: databaseController.accountAuthController,
            icon: Icons.email,
          ),

          //password
          SizedBox(
            height: Get.height * 0.03,
          ),
          CustomTextField(
            title: "Password",
            icon: Icons.lock,
            controller: databaseController.accountPasswordController,
            obsecurePassword: true,
          ),

          SizedBox(
            height: Get.height * 0.05,
          ),
          CategorySelection(),

          SizedBox(
            height: 30,
          ),

          GestureDetector(
            child: Center(
              child: Container(
                width: Get.width * 0.3,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: color1, borderRadius: BorderRadius.circular(18)),
                child: Center(
                  child: Text(
                    "Save",
                    style: montserratStyle(fontColor: white),
                  ),
                ),
              ),
            ),
            onTap: () {
              databaseController.addAccount();
            },
          )
        ],
      ),
    );
  }
}
