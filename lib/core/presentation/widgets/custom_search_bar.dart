import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:swift_mart/core/constants/app_fonts.dart';
import 'package:swift_mart/core/theme/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  final ValueChanged<String>? onSearchChanged;
  final TextEditingController? controller;

  const CustomSearchBar({super.key, this.onSearchChanged, this.controller});

  @override
  Widget build(BuildContext context) {
    // Defines a localized outline style matching your system
    final searchBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none, // Removes harsh outer lines for a clean look
    );

    return TextField(
      controller: controller,
      onChanged: onSearchChanged,
      decoration: InputDecoration(
        hintText: "Search items...",
        hintStyle: TextStyle(
          fontSize: AppFonts.caption,
          fontWeight: AppFonts.medium,
          color: AppColors.textSecondary,
        ),
        prefixIcon: UnconstrainedBox(
          child: HugeIcon(
            icon: HugeIcons.strokeRoundedSearch02,

            strokeWidth: 2,
            size: 24,
            color: AppColors.textSecondary,
          ),
        ),
        filled: true,
        fillColor: AppColors.bgGray,
        border: searchBorder,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.bgGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.blue, width: 1.5),
        ),
      ),
    );
  }
}
