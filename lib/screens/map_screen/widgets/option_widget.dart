import 'package:flutter/material.dart';
import 'package:ride_sense/screens/map_screen/widgets/custom_text.dart';

Widget optionWidget(
      String message, bool isSelected, VoidCallback ontap, Size size) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.transparent,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(size.width * 0.1),
          border: Border.all(color: Colors.blue,width: 1)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04, vertical: size.height * 0.006),
          child: getText(message, size*0.8,
              color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }