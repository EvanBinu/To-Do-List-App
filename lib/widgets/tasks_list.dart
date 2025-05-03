import 'package:flutter/material.dart';
import 'task_tile.dart';
import '../models/task_data.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              isChecked: Provider.of<TaskData>(context).tasks[index].isDone,
              taskTitle: Provider.of<TaskData>(context).tasks[index].name,
              checkboxCallback: (checkboxState) {},
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
