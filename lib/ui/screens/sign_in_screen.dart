import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

import '../utils/app_colors.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  static const String name = '/sign-in';
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: ScreenBackground(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80,),
                  Text("Get Started With",
                   style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 24,),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 8,),
                  TextFormField(
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
                    child: Column(
                      children: [
                        TextButton(
                            onPressed: (){},
                            child: Text("Forgot Password?"),
                        ),
                        _buildSignUpSection(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
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

              },
            )
          ]
      ));
}
