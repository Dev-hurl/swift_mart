import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:swift_mart/core/constants/app_fonts.dart';
import 'package:swift_mart/core/presentation/widgets/custom_text_form_field.dart';
import 'package:swift_mart/core/theme/app_colors.dart';
import 'package:swift_mart/features/registration/verification/verification_screen.dart';
import 'package:swift_mart/features/registration/verification/verify_phone.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        leading: BackButton(
          color: AppColors.textPrimary,
          onPressed: () {
            //
          },
        ),
      ),*/
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Confirm Email Address',
              style: TextStyle(
                fontSize: AppFonts.heading2,
                fontWeight: AppFonts.bold,
                color: AppColors.blue,
              ),
            ),
            Text(
              'Please enter your email address to receive a confirmation to proceed.',
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
                    fontWeight: AppFonts.semibold,
                    color: AppColors.textSecondary,
                  ),
                ),
                CustomTextFormField(
                  controller: _emailController,
                  hinText: 'e.g. Johndoe@gmail.com',
                  prefixIcon: Icon(Icons.email_rounded),
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
                      builder: (context) => VerificationScreen(),
                    ),
                  );
                },
                child: Text('Verify Email'),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.center,
              child: Text.rich(
                TextSpan(
                  text: 'Verify with',
                  style: TextStyle(
                    fontSize: AppFonts.caption,
                    fontWeight: AppFonts.semibold,
                    color: AppColors.textSecondary,
                  ),
                  children: [
                    TextSpan(
                      text: ' Phone number.',
                      style: TextStyle(
                        fontSize: AppFonts.caption,
                        fontWeight: AppFonts.semibold,
                        color: AppColors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerifyPhone(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
