
import 'package:flutter/material.dart';
import 'package:university_management/core/utils/app_constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      textDirection: TextDirection.rtl,
      cursorColor: Colors.grey[700],
      decoration: InputDecoration(
        hoverColor: Colors.transparent,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.blueWpuColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.blueWpuColor,
            width: 2.5,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        hintText: "اسم المادة",
        hintTextDirection: TextDirection.rtl,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        suffixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
      ),
    );
  }
}