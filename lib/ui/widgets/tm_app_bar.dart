import 'package:flutter/material.dart';
import 'package:task_manager/ui/controllers/auth_controller.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import 'package:task_manager/ui/screens/update_profile_screen.dart';
import '../utils/app_colors.dart';

class TMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppBar({super.key, this.fromUpdateProfile = false});
  final bool fromUpdateProfile;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: AppColors.themeColor,
      title: Row(
        children: [
          const CircleAvatar(
            radius: 16,
          ),
          const SizedBox(width: 8,),
          Expanded(
            child: GestureDetector(
              onTap: (){
                if(fromUpdateProfile) return;
                Navigator.pushNamed(context, UpdateProfileScreen.name);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   AuthController.userModel?.fullName ?? '',
                    style: textTheme.titleSmall?.copyWith(
                        color: Colors.white
                    ),
                  ),
                  Text(
                    AuthController.userModel?.email ?? '',
                    style: textTheme.bodySmall?.copyWith(
                        color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(onPressed: (){
            Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (predicate) => false);
          }, icon: const Icon(Icons.logout, color: Colors.white,))

        ],
      ),

    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56);
}