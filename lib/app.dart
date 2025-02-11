import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/controller_binder.dart';
import 'package:task_manager/ui/screens/add_new_task_screen.dart';
import 'package:task_manager/ui/screens/forgot_password_verify_email_screen.dart';
import 'package:task_manager/ui/screens/forgot_password_verify_otp_screen.dart';
import 'package:task_manager/ui/screens/main_bottom_nav_screen.dart';
import 'package:task_manager/ui/screens/reset_password_screen.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/screens/sign_up_screen.dart';
import 'package:task_manager/ui/screens/splash_screen.dart';
import 'package:task_manager/ui/screens/update_profile_screen.dart';
import 'package:task_manager/ui/utils/app_colors.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinder(),
      navigatorKey: navigatorKey,
      theme: ThemeData(
        colorSchemeSeed: AppColors.themeColor,
        textTheme: TextTheme(
          titleLarge: GoogleFonts.poppins(
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
          titleSmall: GoogleFonts.poppins(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          fillColor: Colors.white,
          hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.w400, color: Colors.grey),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.themeColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            fixedSize: const Size.fromWidth(double.maxFinite),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            foregroundColor: Colors.white,
            textStyle: GoogleFonts.poppins(fontSize: 16),
          ),
        ),
      ),
      getPages: [
        GetPage(name: SplashScreen.name, page: () => const SplashScreen()),
        GetPage(name: SignInScreen.name, page: () => const SignInScreen()),
        GetPage(name: SignUpScreen.name, page: () => const SignUpScreen()),
        GetPage(name: ForgotPasswordVerifyEmailScreen.name, page: () => const ForgotPasswordVerifyEmailScreen()),
        GetPage(name: ForgotPasswordVerifyOtpScreen.name, page: () => const ForgotPasswordVerifyOtpScreen()),
        GetPage(name: ResetPasswordScreen.name, page: () => const ResetPasswordScreen()),
        GetPage(name: MainBottomNavScreen.name, page: () => const MainBottomNavScreen()),
        GetPage(name: AddNewTaskScreen.name, page: () => const AddNewTaskScreen()),
        GetPage(name: UpdateProfileScreen.name, page: () => const UpdateProfileScreen()),
      ],
      initialRoute: SplashScreen.name,
    );
  }
}
