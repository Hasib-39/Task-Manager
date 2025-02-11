import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/data/models/task_count_by_status_model.dart';
import 'package:task_manager/data/models/task_count_model.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/ui/controllers/new_task_controller.dart';
import 'package:task_manager/ui/controllers/task_count_by_status_controller.dart';
import 'package:task_manager/ui/screens/add_new_task_screen.dart';
import 'package:task_manager/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';
import 'package:task_manager/ui/widgets/task_item_widget.dart';
import 'package:task_manager/ui/widgets/task_status_summary_counter_widget.dart';
import 'package:task_manager/ui/widgets/tm_app_bar.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {
  TaskCountByStatusModel? taskCountByStatusModel;
  final NewTaskController _newTaskController = Get.find<NewTaskController>();
  final TaskCountByStatusController _taskCountByStatusController = Get.find<TaskCountByStatusController>();
  @override
  void initState() {
    super.initState();
    _getTaskCountByStatus();
    _getNewTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TMAppBar(),
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTasksSummaryByStatus(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GetBuilder<NewTaskController>(builder: (controller) {
                  return Visibility(
                    visible: controller.getTaskListInProgress == false,
                    replacement: const CenteredCircularProgressIndicator(),
                    child: _buildTaskListView(controller.taskList),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AddNewTaskScreen.name);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTaskListView(List<TaskModel> taskList) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: taskList.length,
      itemBuilder: (context, index) {
        return TaskItemWidget(
          taskModel: taskList[index],
        );
      },
    );
  }

  Widget _buildTasksSummaryByStatus() {
    return GetBuilder<TaskCountByStatusController>(
      builder: (controller) {
        return Visibility(
          visible: controller.inProgress == false,
          replacement: const CenteredCircularProgressIndicator(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.taskByStatusList.length ?? 0,
                itemBuilder: (context, index) {
                  final TaskCountModel model =
                  controller.taskByStatusList[index];
                  return TaskStatusSummaryCounterWidget(
                    title: model.sId ?? '',
                    count: model.sum.toString(),
                  );
                },
              ),
            ),
          ),
        );
      }
    );
  }

  Future<void> _getTaskCountByStatus() async {
    final bool isSuccess = await _taskCountByStatusController.getTaskCountByStatus();
    if (!isSuccess) {
      showSnackBarMessage(context, _taskCountByStatusController.errorMessage!);
    }
  }

  Future<void> _getNewTaskList() async {
    final bool isSuccess = await _newTaskController.getTaskList();
    if (!isSuccess) {
      showSnackBarMessage(context, _newTaskController.errorMessage!);
    }
  }
}
