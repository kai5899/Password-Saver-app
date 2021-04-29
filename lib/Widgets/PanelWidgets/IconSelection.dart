import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_saver/Configuration/Fonts.dart';
import 'package:password_saver/Configuration/Pallette.dart';
import 'package:password_saver/Controllers/DatabaseController.dart';

class IconSelection extends StatelessWidget {
  IconSelection();
  final DatabaseController databaseController = Get.put(DatabaseController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Icon : ",
                  style: montserratStyle(
                      fontColor: color1, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    ChoiceChip(
                      label: Text("Previous"),
                      selected: true,
                      onSelected: (b) {
                        if (!(databaseController.startTIcon.value - 4 == -4)) {
                          databaseController.paginateLess();
                        }
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ChoiceChip(
                      label: Text("Next"),
                      selected: true,
                      onSelected: (b) {
                        print(databaseController.startTIcon.value);
                        if (!(databaseController.startTIcon.value + 2 == 114)) {
                          databaseController.paginateMore();
                        }
                      },
                    )
                  ],
                )
              ],
            ),
            margin: EdgeInsets.all(32),
          ),
          Center(
            child: Container(
              // height: Get.height * 0.3,
              width: Get.width * 0.95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: color1.withOpacity(0.1),
              ),
              child: Obx(() {
                int start = max(databaseController.startTIcon.value, 0);
                int end = min(databaseController.endTIcon.value, 115);
                return Wrap(
                  children: List.generate(115, (index) {
                    return Container(
                      margin: EdgeInsets.all(8),
                      height: Get.width * 0.95 * 0.2,
                      width: Get.width * 0.95 * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: databaseController.selectedAccountIcon.value ==
                                "$index"
                            ? color1.withOpacity(1)
                            : white.withOpacity(0.6),
                        image: DecorationImage(
                            image: Image.asset(
                              "assets/icons/accounts/$index.png",
                              fit: BoxFit.contain,
                              height: 60,
                              width: 60,
                            ).image,
                            fit: BoxFit.contain),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          databaseController.selectedAccountIcon("$index");
                        },
                      ),
                    );
                  }).sublist(start, end),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
