import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/screens/main_bottom_nav_screen.dart';
import 'package:task_manager/ui/screens/sign_up_screen.dart';
import 'package:task_manager/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';

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
  bool _signInProgress = false;
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
                      validator: (String? value){
                        if(value?.trim().isEmpty ?? true){
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8,),
                    TextFormField(
                      controller: _passwordTEController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                      validator: (String? value){
                        if(value?.trim().isEmpty ?? true){
                          return 'Enter your valid password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24,),
                    Visibility(
                      visible: _signInProgress == false,
                      replacement: const CenteredCircularProgressIndicator(),
                      child: ElevatedButton(
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
                          onPressed: _onTapSignInButton,
                          child: const Icon(Icons.arrow_circle_right_outlined, color: Colors.white,)
                      ),
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

  void _onTapSignInButton(){
    if(_formKey.currentState!.validate()){
      _signIn();
    }
  }

  Future<void> _signIn() async {
    _signInProgress = true;
    setState(() {

    });
    Map<String, dynamic> requestBody ={
      "email" : _emailTEController.text.trim(),
      "password" : _passwordTEController.text
    };
    final NetworkResponse response = await NetworkCaller.postRequest(url: Urls.signInUrl, body: requestBody);
    if(response.isSuccess){
      Navigator.pushReplacementNamed(context, MainBottomNavScreen.name);
    }else{
      _signInProgress = false;
      setState(() {

      });
      if(response.statusCode == 401){
        showSnackBarMessage(context, 'Email/Password is invalid! Try Again.');
      } else{
        showSnackBarMessage(context, response.errorMessage);
      }
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




