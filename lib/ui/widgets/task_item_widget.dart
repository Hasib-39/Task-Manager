import 'package:flutter/material.dart';
import 'package:task_manager/data/models/task_model.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key, required this.taskModel,
  });

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: ListTile(
        title: Text(taskModel.title ?? ''),
        tileColor: Colors.white,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(taskModel.description ?? ''),
            Text("Date: ${taskModel.createdDate ?? ''}"),
            const SizedBox(height: 4,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: _getStatusColor(taskModel.status ?? 'New'),
                  ),
                  child:  Text(taskModel.status ?? 'New', style: const TextStyle(color: Colors.white),),
                ),
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: const Icon(Icons.delete, color: Colors.redAccent,)),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.edit))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Color? _getStatusColor(String status){
    if(status == 'New'){
      return Colors.blue;
    } else if(status == 'Progress'){
      return Colors.purple;
    } else if(status == 'Cancelled'){
      return Colors.red;
    } else if (status == 'Completed'){
      return Colors.green;
    }
  }
}