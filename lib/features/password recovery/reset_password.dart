import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:swift_mart/core/constants/app_fonts.dart';
import 'package:swift_mart/core/presentation/widgets/custom_alert_dialog.dart';
import 'package:swift_mart/core/presentation/widgets/custom_text_form_field.dart';
import 'package:swift_mart/core/theme/app_colors.dart';
import 'package:swift_mart/features/registration/sign_in.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _showVerificationSuccessModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          icon: Icon(
            Icons.check_circle_rounded,
            color: AppColors.blue,
            size: 40,
          ),
          title: 'Successful',
          description:
              'Password reset Successful.',
          confirmLabel: 'Re-Login',
          onConfirm: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignIn()),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reset Password?',
              style: TextStyle(
                fontSize: AppFonts.heading2,
                fontWeight: AppFonts.bold,
                color: AppColors.blue,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Please verify your email to receive a confirmation to set a new password',
              style: TextStyle(
                fontSize: AppFonts.caption,
                fontWeight: AppFonts.medium,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New Password',
                  style: TextStyle(
                    fontSize: AppFonts.caption,
                    fontWeight: AppFonts.medium,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 4),
                CustomTextFormField(
                  controller: _passwordController,
                  hinText: 'Enter new Password',
                  prefixIcon: UnconstrainedBox(
                    child: HugeIcon(icon: HugeIcons.strokeRoundedMail02),
                  ),
                  suffixIcon: UnconstrainedBox(
                    child: HugeIcon(icon: HugeIcons.strokeRoundedViewOff),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Confirm Password',
                  style: TextStyle(
                    fontSize: AppFonts.caption,
                    fontWeight: AppFonts.medium,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 4),
                CustomTextFormField(
                  controller: _passwordController,
                  hinText: 'Confirm Password',
                  prefixIcon: UnconstrainedBox(
                    child: HugeIcon(icon: HugeIcons.strokeRoundedMail02),
                  ),
                  suffixIcon: UnconstrainedBox(
                    child: HugeIcon(icon: HugeIcons.strokeRoundedViewOff),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: FilledButton(
                style: FilledButton.styleFrom(backgroundColor: AppColors.blue),
                onPressed: () {
                  _showVerificationSuccessModal(context);
                },
                child: Text('Reset Password'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
