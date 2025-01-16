import 'package:flutter/material.dart';
import 'package:task_manager/data/models/task_count_by_status_model.dart';
import 'package:task_manager/data/models/task_count_model.dart';
import 'package:task_manager/data/services/network_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/screens/add_new_task_screen.dart';
import 'package:task_manager/ui/utils/app_colors.dart';
import 'package:task_manager/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';

import '../widgets/task_item_widget.dart';
import '../widgets/task_status_summary_counter_widget.dart';
import '../widgets/tm_app_bar.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {
  bool _getTaskCountByStatusInProgress = false;
  TaskCountByStatusModel? taskCountByStatusModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getTaskCountByStatus();
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
                child: _buildTaskListView(),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, AddNewTaskScreen.name);
      }, child: const Icon(Icons.add),),
    );
  }

  Widget _buildTaskListView() {
    return ListView.builder(
              shrinkWrap: true,
                itemCount: 10,
                primary: false,
                itemBuilder: (context, index){
                return TaskItemWidget();
                }
            );
  }

  Widget _buildTasksSummaryByStatus() {
    return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Visibility(
              visible: _getTaskCountByStatusInProgress == false,
              replacement: const CenteredCircularProgressIndicator(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: taskCountByStatusModel?.taskByStatusList?.length ?? 0,
                      itemBuilder: (context, index){
                      final TaskCountModel model = taskCountByStatusModel!.taskByStatusList![index];
                      return TaskStatusSummaryCounterWidget(
                          count: model.sum.toString(),
                          title: model.sId ?? '',
                      );
                  }),
                ),
              ),
            ),
          );
  }

  Future<void> _getTaskCountByStatus() async {
    _getTaskCountByStatusInProgress = true;
    setState(() {});
    final NetworkResponse response = await NetworkCaller.getRequest(url: Urls.taskCountByStatus);
    if(response.isSuccess){
      taskCountByStatusModel = TaskCountByStatusModel.fromJson(response.responseData!);
    } else{
      showSnackBarMessage(context, response.errorMessage);
    }
    _getTaskCountByStatusInProgress = false;
    setState(() {});
  }
}







