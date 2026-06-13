import 'package:flutter/material.dart';
import 'package:swift_mart/core/constants/app_fonts.dart';
import 'package:swift_mart/core/theme/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hinText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hinText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      scrollPhysics: NeverScrollableScrollPhysics(),
      obscureText: obscureText,
    
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
          borderSide: BorderSide(
            color: AppColors.blue,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.error,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
