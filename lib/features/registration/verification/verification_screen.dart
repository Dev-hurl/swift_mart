import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swift_mart/core/constants/app_fonts.dart';
import 'package:swift_mart/core/theme/app_colors.dart';
import 'package:swift_mart/features/registration/profile/basic_profile.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        leading: Container(
          width: 48,
          height: 48,
          color: AppColors.bgGray,
          child: BackButton(
            color: AppColors.textPrimary,
            onPressed: () {
              //
            },
          ),
        ),
      ),*/
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Text(
                'Confirm Verification Code',
                style: TextStyle(
                  fontSize: AppFonts.heading2,
                  fontWeight: AppFonts.bold,
                  color: AppColors.blue,
                ),
              ),
              Text(
                'Please enter the confirmation code sent to email or phone to proceed.',
                //text span here & be able to change to which ever verification method was chosen
                style: TextStyle(
                  fontSize: AppFonts.caption,
                  fontWeight: AppFonts.medium,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _VerificationInputBox(first: true, last: false),
                  _VerificationInputBox(first: true, last: false),
                  _VerificationInputBox(first: true, last: false),
                  _VerificationInputBox(first: false, last: true),
                ],
              ),

              SizedBox(height: 32),
              SizedBox(
                height: 48,
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.blue,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BasicProfile()),
                    );
                  },
                  child: Text(
                    'Verify Code',
                    style: TextStyle(
                      fontSize: AppFonts.body,
                      fontWeight: AppFonts.semibold,
                      color: AppColors.textWhite,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(
                    text: 'Didn\'t receive code?',
                    style: TextStyle(
                      fontSize: AppFonts.caption,
                      fontWeight: AppFonts.semibold,
                      color: AppColors.textSecondary,
                    ),
                    children: [
                      TextSpan(
                        text: ' Resend.',
                        style: TextStyle(
                          fontSize: AppFonts.caption,
                          fontWeight: AppFonts.semibold,
                          color: AppColors.blue,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            //
                          },
                      ),
                    ],
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

class _VerificationInputBox extends StatelessWidget {
  final bool first;
  final bool last;

  const _VerificationInputBox({required this.first, required this.last});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 52,
      height: 52,
      child: TextFormField(
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        onChanged: (value) {
          if (value.length == 1 && !last) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && !first) {
            FocusScope.of(context).previousFocus();
          }
        },
        autofocus: first,
        showCursor: false,
        readOnly: false,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          contentPadding: EdgeInsetsDirectional.symmetric(vertical: 16),
          filled: true,
          fillColor: AppColors.bgGray,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.textTertiary, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.blue, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.error, width: 1.5),
          ),
        ),
      ),
    );
  }
}
