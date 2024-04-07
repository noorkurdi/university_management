import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:university_management/core/utils/app_constants.dart';
import 'package:university_management/core/utils/app_services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController inputController;
  final String hintText;
  final Color primaryColor;
  final String? labelText;
  final Widget suffixIcon;
  final TextInputType? keyboardType;
  final bool isPassword;
  final FocusNode? focusNode;
  final String? Function(String?)? validation;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  
  const CustomTextField(
      {Key? key,
      this.validation,
      this.inputFormatters,
      this.onFieldSubmitted,
      this.textInputAction,
      required this.isPassword,
      this.keyboardType,
      required this.suffixIcon,
      required this.inputController,
      required this.hintText,
      this.focusNode,
      this.labelText,
      this.primaryColor = Colors.indigo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validation,
      controller: inputController,
      obscureText: isPassword,
      inputFormatters: inputFormatters,
      cursorColor: AppColors.blueWpuColor,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      style: TextStyle(
        fontSize: AppServices.getResponsiveFontSize(context, fontSize: 22),
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: labelText,
        hoverColor: Colors.transparent,
        labelStyle: TextStyle(
          color: AppColors.blueWpuColor,
          fontWeight: FontWeight.bold,
          fontSize: AppServices.getResponsiveFontSize(context, fontSize: 23),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: AppServices.getResponsiveFontSize(
            context,
            fontSize: 20,
          ),
        ),
        fillColor: Colors.transparent,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(color: primaryColor.withOpacity(.1), width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.blueWpuColor, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(color: primaryColor.withOpacity(.1), width: 1.0),
        ),
      ),
    );
  }
}
