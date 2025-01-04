import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/main_bottom_nav_screen.dart';
import 'package:task_manager/ui/screens/sign_up_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

import '../utils/app_colors.dart';
import 'forgot_password_verify_email_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: ScreenBackground(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 80,),
                    Text("Get Started With",
                     style: textTheme.titleLarge,
                    ),
                    const SizedBox(height: 24,),
                    TextFormField(
                      controller: _emailTEController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                    const SizedBox(height: 8,),
                    TextFormField(
                      controller: _passwordTEController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                    ),
                    const SizedBox(height: 24,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.themeColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        fixedSize: const  Size.fromWidth(double.maxFinite),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                          fontSize: 16
                        )
                      ),
                        onPressed: (){
                          Navigator.pushReplacementNamed(context, MainBottomNavScreen.name);
                        },
                        child: const Icon(Icons.arrow_circle_right_outlined)
                    ),
                    const SizedBox(height: 48,),
                    Center(
                      child: Column(
                        children: [
                          TextButton(
                              onPressed: (){
                                Navigator.pushNamed(context, ForgotPasswordVerifyEmailScreen.name);
                              },
                              child: const Text("Forgot Password?"),
                          ),
                          _buildSignUpSection(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
  Widget _buildSignUpSection(){
    return RichText(
        text: TextSpan(
            text: "Don't have an account? ",
            style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w600
            ),
            children: [
              TextSpan(
                text: "Sign Up",
                style: TextStyle(
                    color: AppColors.themeColor,
                    fontWeight: FontWeight.w600
                ),
                recognizer: TapGestureRecognizer()..onTap = (){
                  Navigator.pushNamed(context, SignUpScreen.name);
                },
              )
            ]
        ));
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}




