import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/tm_app_bar.dart';

import '../utils/app_colors.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  static const String name = '/update-profile';
  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
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
      appBar: const TMAppBar(fromUpdateProfile: true,),
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 48,),
                  Text("Update Profile",
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 24,),
                  _buildPhotoPicker(),
                  const SizedBox(height: 8,),
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
                      child: const Icon(Icons.arrow_circle_right_outlined, color: Colors.white,)
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoPicker() {
    return Container(
                height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.circular(8)
                  ),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8)
                        )
                      ),
                      child: const Text("Photo", style: TextStyle(color: Colors.white),),
                    ),
                    const SizedBox(width: 12,),
                    const Text("No Item Selected", maxLines: 1,)
                  ],
                ),
              );
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
