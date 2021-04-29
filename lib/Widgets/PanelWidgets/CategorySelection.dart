import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_saver/Configuration/Fonts.dart';
import 'package:password_saver/Configuration/Pallette.dart';
import 'package:password_saver/Controllers/DatabaseController.dart';
import 'package:password_saver/Models/Category.dart';

class CategorySelection extends StatelessWidget {
  CategorySelection();

  final DatabaseController databaseController = Get.put(DatabaseController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Category : ",
                      style: montserratStyle(
                          fontColor: color1, fontWeight: FontWeight.w500),
                    ),
                    ChoiceChip(
                      label: Text("add category"),
                      labelStyle:
                          montserratStyle(fontColor: color1, fontSize: 14),
                      selected: true,
                      onSelected: (b) {
                        // Get.to(
                        //   Scaffold(
                        //     body: CategoryAddPage(),
                        //   ),
                        //   transition: Transition.rightToLeftWithFade,
                        //   duration: Duration(milliseconds: 500),
                        // );
                      },
                    )
                  ],
                ),
              ),
              margin: EdgeInsets.all(16),
            ),
            Center(
              child: databaseController.categories.length == 0
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "No Categories yet add some",
                            style: montserratStyle(
                                fontColor: color1, fontSize: 36),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  : Container(
                      height: Get.height * 0.2,
                      width: Get.width * 0.95,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: color1.withOpacity(0.1),
                      ),
                      child: ListView(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          children: List.generate(
                              databaseController.categories.length, (index) {
                            Category category =
                                databaseController.categories[index];
                            return Padding(
                              child: ListTile(
                                leading: Container(
                                  width: 8,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Color(category.color),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12.0))),
                                ),
                                title: Text(
                                  category.title,
                                  style: montserratStyle(
                                      fontColor: color1,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                                trailing: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: backgroundGreyDark),
                                  child: Center(
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 500),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: databaseController
                                                      .selectedCategoryId
                                                      .value ==
                                                  category.id
                                              ? color1
                                              : backgroundGreyDark),
                                      width: 15,
                                      height: 15,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  databaseController.selectedCategoryId.value =
                                      category.id;
                                  databaseController.selectedCategoryColor
                                      .value = category.color;

                                  print(databaseController.selectedCategoryId);
                                },
                              ),
                              padding: EdgeInsets.only(
                                  left: 8, right: 8, bottom: 4, top: 4),
                            );
                          }),
                        ),
                    ),
            ),
          ],
        ),
      );
    });
  }
}
