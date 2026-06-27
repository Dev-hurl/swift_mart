import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:swift_mart/core/constants/app_fonts.dart';
import 'package:swift_mart/core/presentation/widgets/custom_text_form_field.dart';
import 'package:swift_mart/core/theme/app_colors.dart';
import 'package:swift_mart/features/home/home_page.dart';
import 'package:swift_mart/features/registration/profile/address.dart';

class PaymentSetup extends StatefulWidget {
  const PaymentSetup({super.key});

  @override
  State<PaymentSetup> createState() => _PaymentSetupState();
}

class _PaymentSetupState extends State<PaymentSetup> {
  final TextEditingController _holderNameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvNumberController = TextEditingController();

  @override
  void dispose() {
    _holderNameController.dispose();
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Payment Setup',
                style: TextStyle(
                  fontSize: AppFonts.heading2,
                  fontWeight: AppFonts.bold,
                  color: AppColors.blue,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Let’s get to know you so we can personalize your experience',
                style: TextStyle(
                  fontSize: AppFonts.caption,
                  fontWeight: AppFonts.medium,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 16),
              Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    spacing: 8,
                    children: [
                      _ProgressBox(isFilled: true),
                      _ProgressBox(isFilled: true),
                      _ProgressBox(isFilled: true),
                    ],
                  ),
                  Text(
                    '1 OF 3',
                    style: TextStyle(
                      fontSize: AppFonts.caption,
                      fontWeight: AppFonts.bold,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'CARD DETAILS',
                style: TextStyle(
                  fontSize: AppFonts.caption,
                  fontWeight: AppFonts.semibold,
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 16),
              Column(
                spacing: 16,
                children: [
                  //Fullname Field
                  CustomTextFormField(
                    controller: _holderNameController,
                    hinText: 'Enter Card Holder\'s Name',
                    prefixIcon: UnconstrainedBox(
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedMail02,
                        size: 24,
                      ),
                    ),
                  ),

                  CustomTextFormField(
                    controller: _cardNumberController,
                    hinText: 'Card Number',
                    prefixIcon: UnconstrainedBox(
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedCalendar03,
                        size: 24,
                      ),
                    ),
                  ),
                  CustomTextFormField(
                    controller: _expiryDateController,
                    hinText: 'Enter Expiry Date',
                    keyboardType: TextInputType.number,
                  ),
                  CustomTextFormField(
                    controller: _cvvNumberController,
                    hinText: 'Enter Cvv',
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blue,
                    foregroundColor: AppColors.bgWhite,
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: AppFonts.body,
                      fontWeight: AppFonts.medium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProgressBox extends StatelessWidget {
  final bool isFilled;

  const _ProgressBox({required this.isFilled});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 8,
      decoration: BoxDecoration(
        color: isFilled ? AppColors.blue : AppColors.bgGrayLight,
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }
}
