import 'package:flutter/material.dart';
import 'package:swift_mart/core/constants/app_fonts.dart';
import 'package:swift_mart/core/theme/app_colors.dart';

class CustomAlertDialog extends StatelessWidget {
  final Widget title;
  final String text;
  const CustomAlertDialog({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.bgWhiteLight,
      title: title,
      titleTextStyle: TextStyle(
        fontSize: AppFonts.body,
        fontWeight: AppFonts.semibold,
      ),
      content: Text(text),
      actions: [
        FilledButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: TextStyle(
              fontSize: AppFonts.body,
              fontWeight: AppFonts.medium,
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
