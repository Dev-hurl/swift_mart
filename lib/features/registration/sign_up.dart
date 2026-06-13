import 'package:flutter/material.dart';
import 'package:swift_mart/core/constants/app_fonts.dart';
import 'package:swift_mart/core/presentation/widgets/custom_text_form_field.dart';
import 'package:swift_mart/core/theme/app_colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
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
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.bgWhiteLight.withAlpha(30),
                      border: Border.all(color: AppColors.bgWhite, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 40,
                      ),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Welcome Back!',
                                style: TextStyle(
                                  fontSize: AppFonts.heading2,
                                  fontWeight: AppFonts.bold,
                                  color: AppColors.blue,
                                ),
                              ),
                              Text(
                                'Sign Up to continue',
                                style: TextStyle(
                                  fontSize: AppFonts.body,
                                  fontWeight: AppFonts.regular,
                                  color: AppColors.blue,
                                ),
                              ),
                              SizedBox(height: 40),
                              //Email textFF
                              CustomTextFormField(
                                prefixIcon: Icon(Icons.email_rounded),
                                controller: _emailController,
                                hinText: 'e.g. Johndoe@gmailcom',
                              ),
                              /*SizedBox(height: 12),
                              //Password TextFF
                              CustomTextFormField(
                                prefixIcon: Icon(Icons.password_rounded),
                                suffixIcon: Icon(Icons.visibility_off_rounded),
                                obscureText: true,
                                controller: _passwordController,
                                hinText: 'e.g. Enter your Password',
                              ),
                              SizedBox(height: 24),
                              Row(
                                spacing: 4,
                                children: [
                                  Icon(
                                    Icons.check_box_outline_blank_rounded,
                                    color: AppColors.blue,
                                  ),
                                  Text(
                                    'Remember me',
                                    style: TextStyle(
                                      fontSize: AppFonts.caption,
                                      fontWeight: AppFonts.semibold,
                                      color: AppColors.blue,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      fontSize: AppFonts.caption,
                                      fontWeight: AppFonts.semibold,
                                      color: AppColors.error,
                                    ),
                                  ),
                                ],
                              ),*/
                              SizedBox(height: 32),
                              SizedBox(
                                height: 48,
                                width: double.infinity,
                                child: FilledButton(
                                  style: FilledButton.styleFrom(
                                    backgroundColor: AppColors.blue,
                                  ),
                                  onPressed: () {
                                    //
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: AppFonts.body,
                                      fontWeight: AppFonts.semibold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 12),
                              SizedBox(
                                height: 48,
                                width: double.infinity,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: AppColors.blue,
                                  ),
                                  onPressed: () {
                                    //
                                  },
                                  child: Text(
                                    'Continue as Guest',
                                    style: TextStyle(
                                      fontSize: AppFonts.body,
                                      fontWeight: AppFonts.semibold,
                                      color: AppColors.blue,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 24),
                              Text('OR'),
                              SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: AppColors.bgWhiteLight.withAlpha(
                                        20,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: AppColors.bgWhite,
                                        width: 3,
                                      ),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        //
                                      },
                                      icon: Icon(Icons.facebook_rounded, color: AppColors.blue,),
                                    ),
                                  ),
                                  Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: AppColors.bgWhiteLight.withAlpha(
                                        20,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: AppColors.bgWhite,
                                        width: 3,
                                      ),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        //
                                      },
                                      icon: Icon(Icons.facebook_rounded, color: AppColors.blue,),
                                    ),
                                  ),
                                  Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: AppColors.bgWhiteLight.withAlpha(
                                        20,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: AppColors.bgWhite,
                                        width: 3,
                                      ),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        //
                                      },
                                      icon: Icon(Icons.facebook_rounded, color: AppColors.blue),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 32),

                              Text.rich(
                                TextSpan(
                                  text: 'Already have an Account?',
                                  style: TextStyle(
                                    color: AppColors.textPrimary,
                                    fontSize: AppFonts.caption,
                                    fontWeight: AppFonts.regular,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Sign In',
                                      style: TextStyle(
                                        color: AppColors.blue,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
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