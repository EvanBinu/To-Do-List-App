import 'package:flutter/material.dart';
import '../widgets/task_tile.dart';
import '../widgets/tasks_list.dart';
import 'add_task_screen.dart';
import '../models/task.dart';
import '../models/task_data.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder:
                (context) => SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: AddTaskScreen(),
                  ),
                ),
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 60.0,
              left: 30.0,
              right: 30.0,
              bottom: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightBlueAccent,
                  ),
                ),

                SizedBox(height: 10.0),
                Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 300.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TaskList(),
            ),
          ),
        ],
      ),
    );
  }
}
