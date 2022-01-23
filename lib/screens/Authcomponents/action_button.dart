import 'package:assis_tech/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:assis_tech/screens/Authcomponents/constants.dart';

Widget actionButton(String text) {
  return Container(
    height: 50,
    width: double.infinity,
    decoration: BoxDecoration(
      color: kPrimaryColor,
      borderRadius: BorderRadius.all(
        Radius.circular(25),
      ),
      boxShadow: [
        BoxShadow(
          color: kPrimaryColor.withOpacity(0.2),
          spreadRadius: 4,
          blurRadius: 7,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget LoginButton = FlatButton(
  color: transparent,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
  child: Text("Login", style: TextStyle(color: kPrimaryColor, fontSize: 20)),
  height: 50,
  autofocus: true,
  onPressed: () {
    print("ok");

    // Navigator.of(context).pop();
  },
);
