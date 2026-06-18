import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:swift_mart/core/constants/app_fonts.dart';
import 'package:swift_mart/core/presentation/widgets/custom_text_form_field.dart';
import 'package:swift_mart/core/theme/app_colors.dart';

class BasicProfile extends StatefulWidget {
  const BasicProfile({super.key});

  @override
  State<BasicProfile> createState() => _BasicProfileState();
}

class _BasicProfileState extends State<BasicProfile> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _countryCodeController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _countryCodeController.dispose();
    _genderController.dispose();
    _birthdayController.dispose();
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
                'Basic Profile Setup',
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
                    spacing: 12,
                    children: [
                      _ProgressBox(isFilled: true),
                      _ProgressBox(isFilled: false),
                      _ProgressBox(isFilled: false),
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
                'PROFILE INFORMATION',
                style: TextStyle(
                  fontSize: AppFonts.caption,
                  fontWeight: AppFonts.bold,
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 16),
              Column(
                spacing: 16,
                children: [
                  CustomTextFormField(
                    controller: _fullNameController,
                    hinText: 'Enter your FullName',
                    prefixIcon: UnconstrainedBox(
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedMail02,
                        size: 24,
                      ),
                    ),
                  ),
                  /* Drop down for gender*/
                  CustomTextFormField(
                    controller: _birthdayController,
                    hinText: 'select birth date',
                    prefixIcon: UnconstrainedBox(
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedCalendar03,
                        size: 24,
                      ),
                    ),
                  ),
                ],
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
