import 'package:flutter/material.dart';
import 'package:mvvm_floor_example/utils/app_utils.dart';
import 'package:mvvm_floor_example/view/home.dart';

class NavigationManager {
  static void navigateToHome() {
    Navigator.pushAndRemoveUntil(
      AppUtils.appContext,
      MaterialPageRoute(builder: (context) => Home()),
      (route) => false,
    );
  }

  static void pushPage(Widget widget) {
    Navigator.push(
      AppUtils.appContext,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  static void pushAndRemoveUntil(Widget widget) {
    Navigator.pushAndRemoveUntil(
      AppUtils.appContext,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );
  }
}
