import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text getText(String s, Size size, {TextAlign? align, bool? isUnderLine,Color? color}) {
  return Text(s,
      textDirection: TextDirection.ltr,
      textAlign: align ?? TextAlign.center,
      style: GoogleFonts.poppins(
          decoration: isUnderLine != null
              ? TextDecoration.underline
              : TextDecoration.none,
          decorationColor: Colors.white,
          textStyle: TextStyle(
              color:color?? Colors.white,
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.w300)));
}