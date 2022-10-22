// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pinsoftfilm/mixin/colors/colors_mixin.dart';

class CustomTheme with ColorMixin {
  late ThemeData theme;
  CustomTheme() {
    theme = ThemeData.light().copyWith(
        inputDecorationTheme: InputDecorationTheme(
            floatingLabelStyle: TextStyle(color: black),
            hintStyle: TextStyle(color: black),
            labelStyle: TextStyle(color: black),
            fillColor: black,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(style: BorderStyle.solid, color: black)),
            iconColor: black,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(style: BorderStyle.solid, color: black),
            )),
        scaffoldBackgroundColor: white,
        textTheme: TextTheme(
          headline4: TextStyle(color: black, fontWeight: FontWeight.bold),
          headline5: TextStyle(color: black, fontWeight: FontWeight.bold),
          headline6: TextStyle(color: black),
          subtitle1: TextStyle(color: black),
          subtitle2: TextStyle(color: lightGrey),
          bodyText1: TextStyle(color: black),
          bodyText2: TextStyle(color: black, fontWeight: FontWeight.bold),
        ));
  }
}
