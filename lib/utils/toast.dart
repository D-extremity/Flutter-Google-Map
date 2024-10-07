import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void toast(String message,bool isPositive) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor:isPositive? Colors.tealAccent.shade400 : Colors.orange.shade400,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}