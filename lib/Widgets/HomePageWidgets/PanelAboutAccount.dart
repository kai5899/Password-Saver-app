import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:password_saver/Configuration/Fonts.dart';
import 'package:password_saver/Configuration/Pallette.dart';
import 'package:password_saver/Controllers/DatabaseController.dart';
import 'package:password_saver/Models/Account.dart';
import 'package:password_saver/Widgets/CustomTextField.dart';

class PanelAboutAccount extends StatelessWidget {
  PanelAboutAccount({this.sc, this.account});
  final ScrollController sc;
  final Account account;

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
                "About this account",
                style: montserratStyle(
                    fontColor: color5,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${account.title.capitalize}",
                    style: montserratStyle(
                        fontColor: Color(account.color),
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: Image.asset(
                                    "assets/icons/accounts/${account.icon}.png")
                                .image)),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 40),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Email , Username or Phone",
                style: montserratStyle(
                    fontColor: backgroundGreyDark,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "${account.auth.capitalizeFirst}",
                style: montserratStyle(
                    fontColor: color5,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 40),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Password",
                style: montserratStyle(
                    fontColor: backgroundGreyDark,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "${account.password}",
                style: montserratStyle(
                    fontColor: color5,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          GestureDetector(
            child: Center(
              child: Container(
                width: Get.width * 0.8,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Color(account.color),
                    borderRadius: BorderRadius.circular(18)),
                child: Center(
                  child: Text(
                    "Copy",
                    style: montserratStyle(fontColor: white),
                  ),
                ),
              ),
            ),
            onTap: () {
              Clipboard.setData(new ClipboardData(text: account.password));

              Get.showSnackbar(GetBar(
                message: "the password ${account.password} can be used now",
                title: "Password copied to clipboard",
                snackPosition: SnackPosition.TOP,
                duration: Duration(seconds: 1, milliseconds: 500),
                borderRadius: 25,
                backgroundColor: Color(account.color),
                overlayBlur: 24,
              ));
            },
          )
        ],
      ),
    );
  }
}
