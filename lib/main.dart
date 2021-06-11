import 'package:flutter/material.dart';
import 'package:mvvm_floor_example/constants/string_constants.dart';
import 'package:mvvm_floor_example/utils/app_utils.dart';
import 'package:mvvm_floor_example/view/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppUtils.navigatorState,
      title: StringConstants.kAppName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
