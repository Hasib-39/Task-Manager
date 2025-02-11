import 'package:flutter/material.dart';
import 'package:task_manager/data/models/task_model.dart';

import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
    required this.taskModel,
  });

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: ListTile(
        title: Text(taskModel.title ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(taskModel.description ?? ''),
            Text('Date: ${taskModel.createdDate ?? ''}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: _getStatusColor(taskModel.status ?? 'New'),
                  ),
                  child: Text(
                    taskModel.status ?? 'New',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => _showDeleteConfirmationDialog(context) ,
                      icon: const Icon(Icons.delete),
                    ),
                    IconButton(
                      onPressed: () => _showEditStatusDialog(context) ,
                      icon: const Icon(Icons.edit),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  void _showEditStatusDialog(BuildContext context) {
    String selectedStatus = taskModel.status ?? 'New';
    List<String> statusOptions = ['New', 'Progress', 'Completed', 'Cancelled'];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Task Status"),
        content: DropdownButton<String>(
          value: selectedStatus,
          isExpanded: true,
          items: statusOptions.map((status) {
            return DropdownMenuItem<String>(
              value: status,
              child: Text(status),
            );
          }).toList(),
          onChanged: (newValue) {
            if (newValue != null) {
              selectedStatus = newValue;
            }
          },
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () async {
              taskModel.status = selectedStatus;
              await NetworkCaller.getRequest(url: Urls.updateTaskStatusUrl(selectedStatus, taskModel.sId));
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Task"),
        content: const Text("Are you sure you want to delete this task?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              await NetworkCaller.getRequest(url: Urls.deleteTaskUrl(taskModel.sId));
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    if (status == 'New') {
      return Colors.blue;
    } else if (status == 'Progress') {
      return Colors.yellow;
    } else if (status == 'Cancelled') {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }
}