import 'package:get/get.dart';
import 'package:task_manager/ui/controllers/add_new_task_controller.dart';
import 'package:task_manager/ui/controllers/cancelled_task_controller.dart';
import 'package:task_manager/ui/controllers/completed_task_controller.dart';
import 'package:task_manager/ui/controllers/new_task_controller.dart';
import 'package:task_manager/ui/controllers/progress_task_controller.dart';
import 'package:task_manager/ui/controllers/sign_in_controller.dart';
import 'package:task_manager/ui/controllers/sign_up_controller.dart';
import 'package:task_manager/ui/controllers/task_count_by_status_controller.dart';
import 'package:task_manager/ui/controllers/update_profile_controller.dart';
class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
    Get.put(NewTaskController());
    Get.lazyPut(() => CancelledTaskController());
    Get.lazyPut(() => CompletedTaskController());
    Get.lazyPut(() => ProgressTaskController());
    Get.lazyPut(() => AddNewTaskController());
    Get.lazyPut(() => UpdateProfileController());
    Get.lazyPut(() => SignUpController());
    Get.put(TaskCountByStatusController());
  }
}