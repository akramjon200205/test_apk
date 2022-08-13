import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_app/utills/contants.dart';

class TextFieldFunc extends StatelessWidget {
  TextFieldFunc(this.text, this.controllerProText, {Key? key}) : super(key: key);
  String text;
  String controllerProText;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.text = controllerProText;    
    return TextField(
      readOnly: true,
      controller: controller,
      style: kTextStyle(size: 15, color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1.0),
        ),
        // border: const OutlineInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: text,
        labelStyle: kTextStyle(
          size: 14,
          color: Colors.white70,
        ),
      ),
    );
  }
}
