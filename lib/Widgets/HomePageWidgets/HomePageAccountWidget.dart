import 'package:cool_alert/cool_alert.dart';
import 'package:encrypt/encrypt.dart' as enc;
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:password_saver/Configuration/Fonts.dart';
import 'package:password_saver/Configuration/Pallette.dart';
import 'package:password_saver/Controllers/DatabaseController.dart';
import 'package:password_saver/Models/Account.dart';

class HomePageAccountWidget extends StatelessWidget {
  final Account account;
  HomePageAccountWidget({this.account});

  @override
  Widget build(BuildContext context) {
    final key = enc.Key.fromLength(32);
    final iv = enc.IV.fromLength(8);
    final encrypter = enc.Encrypter(enc.Salsa20(key));

    final encrypted = encrypter.encrypt(account.password, iv: iv);
    // final decrypted = encrypter.decrypt(encrypted, iv: iv);
    return Slidable(
      actionPane: SlidableBehindActionPane(),
      secondaryActions: [
        IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.red,
            size: 48,
          ),
          onPressed: () {},
        )
      ],
      child: AnimatedContainer(
        height: Get.height * 0.15,
        duration: Duration(milliseconds: 500),
        decoration: BoxDecoration(
          color: Color(0xFFF9F6FB),
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
                color: Color(0xFFEFEEEE).withOpacity(0.9),
                offset: Offset(-6.0, -6.0),
                blurRadius: 3.0,
                spreadRadius: -1),
            BoxShadow(
              spreadRadius: 1,
              color: Color(0xFFEFEEEE).withOpacity(0.2),
              offset: Offset(6.0, 6.0),
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10,
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
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  "${account.title.capitalizeFirst}",
                  style: montserratStyle(fontColor: Color(account.color)),
                ),
                subtitle: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Auth : ${account.auth.capitalizeFirst}",
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: montserratStyle(
                          fontColor: backgroundGreyDark, fontSize: 16),
                    ),
                    Text(
                      "Password : ${encrypted.base64}",
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: montserratStyle(
                          fontColor: backgroundGreyDark, fontSize: 12),
                    ),
                  ],
                ),
                trailing: GestureDetector(
                  child: Icon(
                    Icons.remove_red_eye,
                    color: color4,
                  ),
                  onTap: () {
                    Get.find<DatabaseController>()
                        .changeSelectedPanel(2, accountz: account);
                    Get.find<DatabaseController>().panelController.open();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
