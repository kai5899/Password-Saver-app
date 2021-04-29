import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

TextStyle montserratStyle(
    {Color fontColor, FontWeight fontWeight, double fontSize}) {
  return GoogleFonts.montserrat(
    color: fontColor ?? Colors.black,
    fontSize: fontSize ?? 24,
    fontWeight: fontWeight ?? null,
  );
}
