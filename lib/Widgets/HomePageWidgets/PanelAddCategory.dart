import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_saver/Configuration/Fonts.dart';
import 'package:password_saver/Configuration/Pallette.dart';
import 'package:password_saver/Controllers/DatabaseController.dart';
import 'package:password_saver/Widgets/CustomTextField.dart';

class PanelAddCategory extends StatelessWidget {
  PanelAddCategory({this.sc});
  final ScrollController sc;

  final DatabaseController databaseController = Get.put(DatabaseController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
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
            height: 18.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 40),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Add New Category",
                style: montserratStyle(
                    fontColor: color5,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          CustomTextField(
            title: "Category's Title",
            controller: databaseController.categoryTitleController,
            icon: Icons.title,
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Obx(
            () {
              return ColorPicker(
                color: Color(databaseController.selectedCategoryColor.value),
                onColorChanged: (Color color) {
                  databaseController.selectedCategoryColor.value = color.value;
                  print(databaseController.selectedCategoryColor.value);
                },
                heading: Text(
                  'Select color',
                  style: montserratStyle(),
                ),
                subheading: Text(
                  'Select color shade',
                  style: montserratStyle(fontSize: 16),
                ),
              );
            },
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
              databaseController.insertCategory(context);
            },
          )
        ],
      ),
    );
  }
}
