import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swift_mart/core/constants/app_fonts.dart';
import 'package:swift_mart/core/presentation/widgets/custom_text_form_field.dart';
import 'package:swift_mart/core/theme/app_colors.dart';
import 'package:swift_mart/features/registration/verification/verify_email.dart';

class VerifyPhone extends StatefulWidget {
  const VerifyPhone({super.key});

  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  final _phoneController = TextEditingController();
  final _countryCodeController = TextEditingController(text: '+123');
  final _mainFocus = FocusNode();

  @override
  void dispose() {
    _phoneController.dispose();
    _countryCodeController.dispose();
    _mainFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: AppColors.textPrimary,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Confirm Phone Number',
              style: TextStyle(
                fontSize: AppFonts.heading2,
                fontWeight: AppFonts.bold,
                color: AppColors.blue,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Please enter your phone number to receive a confirmation to proceed.',
              style: TextStyle(
                fontSize: AppFonts.caption,
                fontWeight: AppFonts.medium,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 32),
            TextFormField(
              controller: _phoneController,
              focusNode: _mainFocus,
              keyboardType: TextInputType.phone,
              style: TextStyle(
                fontSize: AppFonts.body,
                color: AppColors.textPrimary,
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                hintText: 'Enter phone number',
                hintStyle: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: AppFonts.caption,
                  fontWeight: AppFonts.medium,
                ),
                filled: true,
                fillColor: AppColors.bgGray,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 16, right: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 45,
                      
                        child: TextField(
                          controller: _countryCodeController,
                          keyboardType: TextInputType.phone,
                          
                          style: TextStyle(
                            fontSize: AppFonts.caption,
                            fontWeight: AppFonts.medium,
                            color: AppColors.textSecondary,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                          
                          ),
                        
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(4),
                          ],
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 1.5,
                        color: AppColors.bgGrayLight,
                      
                      ),
                    ],
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColors.textTertiary,
                    
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColors.blue,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.blue,
                ),
                onPressed: () {
                  //
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
                      text: ' Email.',
                      style: TextStyle(
                        fontSize: AppFonts.caption,
                        fontWeight: AppFonts.semibold,
                        color: AppColors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => VerifyEmail()),
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
