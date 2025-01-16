import 'package:flutter/material.dart';
import 'package:task_manager/ui/utils/app_colors.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';

import '../widgets/task_item_widget.dart';
import '../widgets/task_status_summary_counter_widget.dart';
import '../widgets/tm_app_bar.dart';

class CompletedTaskListScreen extends StatefulWidget {
  const CompletedTaskListScreen({super.key});

  @override
  State<CompletedTaskListScreen> createState() => _CompletedTaskListScreenState();
}

class _CompletedTaskListScreenState extends State<CompletedTaskListScreen> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: TMAppBar(),
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: _buildTaskListView(),
        ),
      ),
    );
  }

  Widget _buildTaskListView() {
    return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index){
                // return TaskItemWidget();
                }
            );
  }

  Widget _buildTasksSummaryByStatus() {
    return const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  TaskStatusSummaryCounterWidget(count: '09', title: 'New',),
                  TaskStatusSummaryCounterWidget(count: '09', title: 'Progress',),
                  TaskStatusSummaryCounterWidget(count: '09', title: 'Completed',),
                  TaskStatusSummaryCounterWidget(count: '09', title: 'Cancelled',)
                ],
              ),
            ),
          );
  }
}







