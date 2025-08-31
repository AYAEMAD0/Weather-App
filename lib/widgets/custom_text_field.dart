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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: TextFormField(
        controller: controller,
        onChanged: onChang,
        autofocus: false,
        cursorColor: AppColor.colorPurple,
        keyboardType: TextInputType.text,
        style: TextStyle(color: AppColor.colorWhite,fontSize: 20,fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          hintText: 'search',
          prefixIcon: Icon(Icons.search),
          prefixIconColor: AppColor.colorGrey.withOpacity(0.90),
          hintStyle: TextStyle(
            fontSize: 16,
            color: const Color(0xff8391A1),
            fontWeight: FontWeight.w500,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: AppColor.colorBorderTextField,
              width: 1.6,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: AppColor.colorBorderTextField,
              width: 1.6,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: AppColor.colorErrorTextField,
              width: 1.6,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(
              color: AppColor.colorErrorTextField,
              width: 1.6,
            ),
          ),
          filled: true,
          fillColor: AppColor.colorTrans,
        ),
      ),
    );
  }
}
