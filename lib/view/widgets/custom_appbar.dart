import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/color.dart';

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Colors.white,
    title: Text(
      title,
      style: const TextStyle(
          fontSize: 24, fontWeight: FontWeight.w600, color: maincolor),
    ),
    centerTitle: true,
    leading: GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        height: 32,
        width: 32,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Center(
            child: Icon(
          Icons.arrow_back_ios,
          color: maincolor,
        )),
      ),
    ),
  );
}
