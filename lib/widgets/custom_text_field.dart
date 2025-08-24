import 'package:flutter/material.dart';
import '../core/app_color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.onChang,
  });
  final TextEditingController controller;
  final void Function(String) onChang;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChang,
      autofocus: false,
      cursorColor: AppColor.color_purple,
      keyboardType: TextInputType.text,
      style: TextStyle(color: AppColor.color_white,fontSize: 20,fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        hintText: 'search',
        prefixIcon: Icon(Icons.search),
        prefixIconColor: AppColor.color_grey.withOpacity(0.90),
        hintStyle: TextStyle(
          fontSize: 16,
          color: const Color(0xff8391A1),
          fontWeight: FontWeight.w500,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: AppColor.color_border_text_field,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: AppColor.color_border_text_field,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: AppColor.color_error_text_field,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: AppColor.color_error_text_field,
            width: 1.5,
          ),
        ),
        filled: true,
        fillColor: AppColor.color_trans,
      ),
    );
  }
}
