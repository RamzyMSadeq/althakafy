import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

getStyle(double size, bool isBold, Color color) {
  return GoogleFonts.cairo(
    textStyle: TextStyle(
      fontSize: size,
      fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal,
      color: color,
    ),
  );
}
