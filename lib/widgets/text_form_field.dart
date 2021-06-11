import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController controller = new TextEditingController();
  String hintText;
  String? validationErrorMessage;
  String? requiredFieldErrorMessage;
  String? validationExpression;
  var suffixIcon;
  bool obscureText;
  int nMaxLines;
  Key? key;

  CustomTextFormField(this.controller, this.hintText,
      {this.validationErrorMessage,
      this.requiredFieldErrorMessage,
      this.validationExpression,
      this.suffixIcon,
      this.obscureText = false,
      this.nMaxLines = 1,
      this.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: TextFormField(
        key: key,
        controller: controller,
        obscureText: obscureText,
        maxLines: nMaxLines,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintStyle: TextStyle(fontSize: 12, color: Colors.purple),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          hintText: hintText,
          labelText: hintText,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return requiredFieldErrorMessage;
          } else if (!RegExp(validationExpression!).hasMatch(value)) {
            return validationErrorMessage;
          } else {
            return null;
          }
        },
      ),
    );
  }
}
