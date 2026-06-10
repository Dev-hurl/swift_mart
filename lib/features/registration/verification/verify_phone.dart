import 'package:flutter/material.dart';
import 'package:swift_mart/core/constants/app_fonts.dart';
import 'package:swift_mart/core/presentation/widgets/custom_text_form_field.dart';
import 'package:swift_mart/core/theme/app_colors.dart';

class VerifyPhone extends StatefulWidget {
  const VerifyPhone({super.key});

  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: AppColors.textPrimary,
          onPressed: () {
            //
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Confirm Phone number',
            style: TextStyle(
              fontSize: AppFonts.heading2,
              fontWeight: AppFonts.bold,
              color: AppColors.blue,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Please enter your phone number to receive a confirmation to proceed.',
            style: TextStyle(
              fontSize: AppFonts.caption,
              fontWeight: AppFonts.medium,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 32),
          CustomTextFormField(
            controller: _phoneController,
            hinText: '00 0000 0000',
          ),
          SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: FilledButton(
              onPressed: () {
                //
              },
              child: Text('Verify Phone'),
            ),
          ),
        ],
      ),
    );
  }
}
