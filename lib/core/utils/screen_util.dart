import 'package:flutter/material.dart';

abstract class ScreenUtils {
  static double getScreenWidth(context) => MediaQuery.sizeOf(context).width;
  static double getScreenHeight(context) => MediaQuery.sizeOf(context).height;
}
