import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool isSmall;
  const CustomTextField({
    Key? key,
    this.hintText = 'Enter text',
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.isSmall = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,

      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFEDEDED),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: AppTextStyles.get10MediumTextStyle(color: Color(0xffBEBEBE)),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: isSmall ? 16 : 20,
        ),
      ),
    );
  }
}
