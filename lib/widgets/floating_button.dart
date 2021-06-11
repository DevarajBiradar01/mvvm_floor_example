import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_floor_example/utils/navigation_manager.dart';
import 'package:mvvm_floor_example/view/add_note.dart';

class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.add,
        size: 30,
      ),
      onPressed: () => NavigationManager.pushPage(AddNote()),
    );
  }
}
