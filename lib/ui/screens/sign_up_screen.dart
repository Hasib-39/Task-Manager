import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/controllers/sign_up_controller.dart';
import 'package:task_manager/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';

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
  final SignUpController _signUpController = Get.find<SignUpController>();
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
                      validator: (String? value){
                        if(value?.trim().isEmpty ?? true){
                          return 'Enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8,),
                    TextFormField(
                      controller: _firstNameTEController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'First Name',
                      ),
                      validator: (String? value){
                        if(value?.trim().isEmpty ?? true){
                          return 'Enter your first name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8,),
                    TextFormField(
                      controller: _lastNameTEController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Last Name',
                      ),
                      validator: (String? value){
                        if(value?.trim().isEmpty ?? true){
                          return 'Enter your last name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8,),
                    TextFormField(
                      controller: _mobileTEController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Mobile',
                      ),
                      validator: (String? value){
                        if(value?.trim().isEmpty ?? true){
                          return 'Enter your mobile no';
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
                          return 'Enter your password';
                        }
                        if(value!.length < 6){
                          return 'Enter a password more than 6 letters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24,),
                    GetBuilder<SignUpController>(
                      builder: (controller) {
                        return Visibility(
                          visible: controller.inProgress == false,
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
                              onPressed: (){
                                  _onTapSignUpButton();
                              },
                              child: const Icon(Icons.arrow_circle_right_outlined, color: Colors.white)
                          ),
                        );
                      }
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

  void _onTapSignUpButton(){
    if(_formKey.currentState!.validate()){
      _registerUser();
    }
  }

  Future<void> _registerUser() async {
    bool isSuccess = await _signUpController.registerUser(
        _emailTEController.text.trim(),
        _firstNameTEController.text.trim(),
        _lastNameTEController.text.trim(),
        _mobileTEController.text.trim(),
        _passwordTEController.text
    );
    if(isSuccess){
      _clearTextFields();
    }
    showSnackBarMessage(context, _signUpController.errorMessage!);
  }

  void _clearTextFields(){
    _firstNameTEController.clear();
    _lastNameTEController.clear();
    _passwordTEController.clear();
    _mobileTEController.clear();
    _emailTEController.clear();
  }
  Widget _buildSignInSection(){
    return RichText(
        text: TextSpan(
            text: "Already have an account? ",
            style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w600
            ),
            children: [
              TextSpan(
                text: "Sign In",
                style: const TextStyle(
                    color: AppColors.themeColor,
                    fontWeight: FontWeight.w600
                ),
                recognizer: TapGestureRecognizer()..onTap = (){
                  Get.back();
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




