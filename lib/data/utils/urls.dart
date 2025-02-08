class Urls {
  static const String _baseUrl = 'https://task.teamrabbil.com/api/v1';

  static const String registrationUrl = '$_baseUrl/registration';
  static const String loginUrl = '$_baseUrl/login';
  static const String createTaskUrl = '$_baseUrl/createTask';
  static const String taskCountByStatusUrl = '$_baseUrl/taskStatusCount';
  static String deleteTaskUrl(String? taskId) => '$_baseUrl/deleteTask/$taskId';
  static String updateTaskStatusUrl(String status, String? taskId) => '$_baseUrl/updateTaskStatus/$taskId/$status';
  static String taskListByStatusUrl(String status) =>
      '$_baseUrl/listTaskByStatus/$status';

  static const String updateProfile = '$_baseUrl/profileUpdate';
}