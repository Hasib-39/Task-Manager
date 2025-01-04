import 'package:flutter/material.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static const String name = '/home';
  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  List<Widget> screens = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.new_label_outlined), label: "New"),
          NavigationDestination(icon: Icon(Icons.refresh), label: "Progress"),
          NavigationDestination(icon: Icon(Icons.done), label: "Completed"),
          NavigationDestination(icon: Icon(Icons.cancel_outlined), label: "Cancelled"),

        ],
      ),
    );
  }
}
