import 'package:flutter/material.dart';
import 'package:task_manager/ui/utils/app_colors.dart';

import '../widgets/tm_app_bar.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {
  @override
  Widget build(BuildContext context) {


    return const Scaffold(
      appBar: TMAppBar(),
    );
  }
}



