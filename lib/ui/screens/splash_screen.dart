import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/utils/assets_path.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

import '../widgets/app_logo.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String name = '/';

  Future<void> moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(context, SignInScreen.name);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenBackground(
          child: Center(
            child: AppLogo(),
          ),
        ),
    );
  }
}



