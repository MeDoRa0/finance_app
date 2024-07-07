import 'package:finance_app/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.controller,
    this.hintText = '',
    this.icon,
    this.labelText = '',
    this.keyboardType = TextInputType.text,  this.labelColor=Colors.white,
  });

  final TextEditingController? controller;
  final String hintText;
  final IconData? icon;
  final String labelText;
  final TextInputType keyboardType;
  final Color labelColor;
 

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: labelColor),
        //  labelStyle: TextStyle(color: kPrimaryColor),
        fillColor: kSecondaryPurple,
        filled: true,
        // prefixIcon: Icon(icon),
        hintText: hintText,

        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          //borderSide: BorderSide(color: kPrimaryRed),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
