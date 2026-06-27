import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:swift_mart/core/constants/app_fonts.dart';
import 'package:swift_mart/core/presentation/widgets/custom_text_form_field.dart';
import 'package:swift_mart/core/theme/app_colors.dart';
import 'package:swift_mart/features/registration/profile/payment_setup.dart';

class Address extends StatefulWidget {
  const Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  String? _selectedCity;

  @override
  void dispose() {
    _stateController.dispose();
    _streetController.dispose();
    _postalCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      DropdownMenuItem(value: 'ibadan', child: Text('Ibadan')),
      DropdownMenuItem(value: 'ogbomosho', child: Text('Ogbomosho')),
      DropdownMenuItem(value: 'iseyin', child: Text('Iseyin')),
    ];
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Address',
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
                      _ProgressBox(isFilled: true),
                      _ProgressBox(isFilled: false),
                    ],
                  ),
                  Text(
                    '2 OF 3',
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
                'ADDRESS',
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
                  //State
                  CustomTextFormField(
                    controller: _stateController,
                    hinText: 'State/Region',
                  ),
                  // Drop down for City
                  DropdownButtonFormField(
                    initialValue: _selectedCity,
                    items: items,
                    onChanged: (value) {
                      setState(() {
                        _selectedCity = value;
                      });
                    },
                    validator: (value) {
                      if (value == null) return 'Select City';
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
                    controller: _streetController,
                    hinText: 'Street Address',
                  ),
                  CustomTextFormField(
                    controller: _postalCodeController,
                    hinText: 'Postal Code',
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
                      MaterialPageRoute(builder: (context) => PaymentSetup()),
                    );
                  },
                  child: Text(
                    'Proceed to Payment',
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
