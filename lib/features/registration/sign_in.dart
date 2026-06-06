import 'package:flutter/material.dart';
import 'package:swift_mart/core/constants/app_fonts.dart';
import 'package:swift_mart/core/presentation/widgets/custom_text_form_field.dart';
import 'package:swift_mart/core/theme/app_colors.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
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
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,

                    child: Column(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Welcome Back!',
                              style: TextStyle(
                                fontSize: AppFonts.heading1,
                                fontWeight: AppFonts.bold,
                                color: AppColors.blue,
                              ),
                            ),
                            Text(
                              'Sign In to continue',
                              style: TextStyle(
                                fontSize: AppFonts.body,
                                fontWeight: AppFonts.regular,
                                color: AppColors.blue,
                              ),
                            ),
                            SizedBox(height: 40),
                            //Email textFF
                            CustomTextFormField(
                              icon: Icons.email_rounded,
                              controller: _emailController,
                              hinText: 'e.g. Johndoe@gmailcom',
                            ),
                            SizedBox(height: 12),
                            //Password TextFF
                            CustomTextFormField(
                              icon: Icons.password_rounded,
                              obscureText: true,
                              controller: _passwordController,
                              hinText: 'e.g. Enter your Password',
                            ),
                          ],
                        ),
                      ],
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
