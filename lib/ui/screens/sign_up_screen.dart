import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

import '../utils/app_colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
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
                    Text("Join With Us",
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
                      controller: _firstNameTEController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'First Name',
                      ),
                    ),
                    const SizedBox(height: 8,),
                    TextFormField(
                      controller: _lastNameTEController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Last Name',
                      ),
                    ),
                    const SizedBox(height: 8,),
                    TextFormField(
                      controller: _mobileTEController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Mobile',
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
                        onPressed: (){},
                        child: const Icon(Icons.arrow_circle_right_outlined)
                    ),
                    const SizedBox(height: 48,),
                    Center(
                      child: _buildSignInSection(),
                    )
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
  Widget _buildSignInSection(){
    return RichText(
        text: TextSpan(
            text: "Already have an account? ",
            style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w600
            ),
            children: [
              TextSpan(
                text: "Sign In",
                style: TextStyle(
                    color: AppColors.themeColor,
                    fontWeight: FontWeight.w600
                ),
                recognizer: TapGestureRecognizer()..onTap = (){
                  Navigator.pop(context);
                },
              )
            ]
        ));
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    super.dispose();
  }
}




