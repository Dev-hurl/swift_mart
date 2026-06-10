import 'package:flutter/material.dart';
import 'package:swift_mart/core/constants/app_fonts.dart';
import 'package:swift_mart/core/presentation/pages/onboard3.dart';
import 'package:swift_mart/core/theme/app_colors.dart';

class Onboard2 extends StatelessWidget {
  final  List<String> images = [
    'assets/images/black tshirt.png',
    'assets/images/hanger.png',
    'assets/images/shoe.png',
    'assets/images/woman shoe.png'
  ];
  Onboard2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentGeometry.topRight,
                    child: TextButton(
                      onPressed: () {
                        //
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: AppFonts.body,
                          fontWeight: AppFonts.semibold,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  // Fixed outer height ensures the inner flex ratios scale perfectly
                  SizedBox(
                    height: 360,
                    child: Row(
                      spacing: 16,
                      children: [
                        // 1. LEFT TRACK
                        Expanded(
                          child: Column(
                            spacing: 16,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                flex: 2, // Tall item
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ),
                                  child: Image.asset(
                                    images[0],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1, // Short item
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ),
                                  child: Image.asset(
                                    images[1],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // 2. RIGHT TRACK
                        Expanded(
                          child: Column(
                            spacing: 16,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                flex: 1, // Short item
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ),
                                  child: Image.asset(
                                    images[2],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2, // Tall item
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    12,
                                  ),
                                  child: Image.asset(
                                    images[3],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Column(
                    children: [
                      Text(
                        'Fresh Groceries Delivered',
                        style: TextStyle(
                          fontSize: AppFonts.subheading,
                          fontWeight: AppFonts.semibold,
                          color: AppColors.blue,
                        ),
                      ),
                      Text(
                        'Stock your kitchen with quality food and essentials, all from the comfort of your home.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: AppFonts.body,
                          fontWeight: AppFonts.medium,
                          color: AppColors.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Onboard3()),
                        );
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontSize: AppFonts.caption,
                          fontWeight: AppFonts.semibold,
                          color: AppColors.textWhite,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}