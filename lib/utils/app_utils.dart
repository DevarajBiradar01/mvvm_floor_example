import 'package:flutter/cupertino.dart';

class AppUtils{
  static GlobalKey<NavigatorState> navigatorState = GlobalKey();
  static BuildContext get appContext => navigatorState.currentState!.context;
}