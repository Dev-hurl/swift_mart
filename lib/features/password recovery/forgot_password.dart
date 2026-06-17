import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:swift_mart/core/constants/app_fonts.dart';
import 'package:swift_mart/core/presentation/widgets/custom_text_form_field.dart';
import 'package:swift_mart/core/theme/app_colors.dart';
import 'package:swift_mart/features/password%20recovery/forgot_password_verify.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswrodState();
}

class _ForgotPasswrodState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
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
              'Forgot Password?',
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
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email Address',
                  style: TextStyle(
                    fontSize: AppFonts.body,
                    fontWeight: AppFonts.medium,
                    color: AppColors.textSecondary,
                  ),
                ),
                CustomTextFormField(
                  controller: _emailController,
                  hinText: 'e.g. Johndoe@gmail.com',
                  prefixIcon: UnconstrainedBox(
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedMail02,
                      size: 24,
                      color: AppColors.blue,
                    ),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotPasswordVerify(),
                    ),
                  );
                },
                child: Text('Send Code'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
