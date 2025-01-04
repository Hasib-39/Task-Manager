import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

import '../utils/app_colors.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});
  static const String name = '/forgot-password/reset-password';

  @override
  State<ResetPasswordScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController = TextEditingController();
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
                    Text("Set Password",
                      style: textTheme.titleLarge,
                    ),
                    const SizedBox(height: 4,),
                    Text(
                      "Minimum length of password should be more than 8 letters",
                      style: textTheme.titleSmall,
                    ),
                    const SizedBox(height: 24,),
                    TextFormField(
                      controller: _passwordTEController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'New Password',
                      ),
                    ),
                    const SizedBox(height: 8,),
                    TextFormField(
                      controller: _confirmPasswordTEController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Confirm Password',
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
                        child: const Text("Confirm")
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
            text: "Have an account? ",
            style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w600
            ),
            children: [
              TextSpan(
                text: "Sign In",
                style:const  TextStyle(
                    color: AppColors.themeColor,
                    fontWeight: FontWeight.w600
                ),
                recognizer: TapGestureRecognizer()..onTap = (){
                  Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (value) => false);
                },
              )
            ]
        ));
  }

  @override
  void dispose() {
    _passwordTEController.dispose();
    _confirmPasswordTEController.dispose();
    super.dispose();
  }
}




