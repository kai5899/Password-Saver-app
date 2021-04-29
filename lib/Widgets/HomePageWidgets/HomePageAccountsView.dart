import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_saver/Configuration/Fonts.dart';
import 'package:password_saver/Configuration/Pallette.dart';
import 'package:password_saver/Models/Account.dart';

import 'HomePageAccountWidget.dart';

class HomePageAccounts extends StatelessWidget {
  const HomePageAccounts(this.accounts);
  final List<Account> accounts;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.2,
      child: Center(
        child: Obx(
          () => accounts.length == 0
              ? Container(
                  child: Center(
                    child: Text("No Accounts.Add some!",style: montserratStyle(fontColor: color1),),
                  ),
                )
              : ListView(
                  // shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: List.generate(
                          accounts.length,
                          (index) => Padding(
                                padding: EdgeInsets.all(16),
                                child: HomePageAccountWidget(
                                  account: accounts[index],
                                ),
                              )).toList() +
                      [
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: SizedBox(
                            height: 100,
                          ),
                        )
                      ],
                ),
        ),
      ),
    );
  }
}
