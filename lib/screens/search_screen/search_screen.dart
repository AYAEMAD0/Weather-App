import 'package:flutter/material.dart';

import '../../core/app_color.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen ({super.key});
  static final String search_routeName='search';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Search for City',
              style: TextStyle(
                color: AppColor.color_white,
                fontSize: 25,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
            //  controller: controller,
             // validator: validator,
              autofocus: false,
              cursorColor: AppColor.color_purple,
              keyboardType:TextInputType.text,
              decoration: InputDecoration(
                hintText: 'search',
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: const Color(0xff8391A1),
                  fontWeight: FontWeight.w500,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 18,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(116),
                  borderSide: BorderSide(
                      color: AppColor.color_border_text_field,
                      width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: AppColor.color_border_text_field,
                    width: 1,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: AppColor.color_error_text_field, width: 1),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color:  AppColor.color_error_text_field, width: 1),
                ),
                filled: true,
                fillColor:AppColor.color_trans,
              ),
            ),




        ],),
      ),
    );
  }
}