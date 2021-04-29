import 'package:flutter/material.dart';
import 'package:password_saver/Configuration/Fonts.dart';
import 'package:password_saver/Configuration/Pallette.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({this.title, this.icon, this.obsecurePassword, this.controller});
  final String title;
  final IconData icon;
  final bool obsecurePassword;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "$title",
                style: montserratStyle(
                    fontColor: color1,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: color7.withOpacity(0.2)),
              child: ListTile(
                title: TextField(
                  controller: controller,
                  obscureText: obsecurePassword ?? false,
                  decoration: InputDecoration(
                    icon: Icon(icon),
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: color1, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
