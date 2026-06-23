import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:swift_mart/core/constants/app_fonts.dart';
import 'package:swift_mart/core/presentation/widgets/custom_text_form_field.dart';
import 'package:swift_mart/core/theme/app_colors.dart';
import 'package:swift_mart/features/registration/profile/address.dart';

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
  final _mainFocus = FocusNode();

  DateTime selectedDate = DateTime.now();

  String? _selectedGender;

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _countryCodeController.dispose();
    _genderController.dispose();
    _birthdayController.dispose();
    _mainFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      DropdownMenuItem(value: 'male', child: Text('Male')),
      DropdownMenuItem(value: 'female', child: Text('Female')),
      DropdownMenuItem(
        value: 'prefer not to say',
        child: Text('Prefer not to Say'),
      ),
    ];
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
                    spacing: 8,
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
                    controller: _fullNameController,
                    hinText: 'Enter your FullName',
                    prefixIcon: UnconstrainedBox(
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedMail02,
                        size: 24,
                      ),
                    ),
                  ),
                  //Phone Number field
                  TextFormField(
                    controller: _phoneNumberController,
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
                        padding: EdgeInsets.only(left: 12, right: 8),
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
                                  hintText: '+123',
                                  hintStyle: TextStyle(
                                    fontSize: AppFonts.caption,
                                    color: AppColors.textSecondary,
                                  ),
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
                        borderSide: BorderSide(color: AppColors.bgGray),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: AppColors.blue),
                      ),
                    ),
                  ),
                  // Drop down for gender
                  DropdownButtonFormField(
                    initialValue: _selectedGender,
                    items: items,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                    validator: (value) {
                      if (value == null) return 'Select Gender';
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: UnconstrainedBox(
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedArrowDown01,
                          size: 24,
                        ),
                      ),
                      suffixIconColor: AppColors.blue,
                      hintText: 'Select Gender',
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
                        borderSide: BorderSide(color: AppColors.blue),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: AppColors.error,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                  CustomTextFormField(
                    controller: _birthdayController,
                    hinText: 'Birthday',
                    prefixIcon: UnconstrainedBox(
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedCalendar03,
                        size: 24,
                      ),
                    ),
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
                      MaterialPageRoute(builder: (context) => Address()),
                    );
                  },
                  child: Text(
                    'Proceed to Address',
                    style: TextStyle(
                      fontSize: AppFonts.body,
                      fontWeight: AppFonts.semibold,
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
