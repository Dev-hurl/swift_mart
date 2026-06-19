import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swift_mart/core/constants/app_fonts.dart';
import 'package:swift_mart/core/theme/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hinText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatter;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hinText,
    this.focusNode,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatter,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      scrollPhysics: NeverScrollableScrollPhysics(),
      obscureText: obscureText,
      inputFormatters: inputFormatter,
      style: TextStyle(fontSize: AppFonts.body, color: AppColors.textSecondary),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        prefixIconColor: AppColors.blue,
        suffixIcon: suffixIcon,
        suffixIconColor: AppColors.blue,
        hintText: hinText,
        hintStyle: TextStyle(
          fontSize: AppFonts.caption,
          fontWeight: AppFonts.medium,
          color: AppColors.textSecondary,
        ),
        filled: true,
        fillColor: AppColors.bgGray,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.bgGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.blue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.error, width: 1.5),
        ),
      ),
    );
  }
}
