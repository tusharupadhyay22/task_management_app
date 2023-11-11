import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Task {
  String name;
  bool isSelected;

  Task(this.name, this.isSelected);
}

class TaskManagementDashboard extends StatefulWidget {
  TaskManagementDashboard({
    Key? key,
  }) : super(key: key);

  @override
  State<TaskManagementDashboard> createState() => _TaskManagementDashboardState();
}

class _TaskManagementDashboardState extends State<TaskManagementDashboard> {
  List<Task> tasks = [
    Task('Running', false),
    Task('Gym', false),
    Task('Reading', false),
    Task('Swimming', false),
    Task('Coding', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Management Dashboard'),
      ),
      body: TaskList(tasks: tasks),
    );
  }
}

class TaskList extends StatefulWidget {
  final List<Task> tasks;

  TaskList({required this.tasks});

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(widget.tasks[index].name),
          trailing: Radio(
            value: index,
            groupValue: widget.tasks.indexWhere((element) => element.isSelected),
            onChanged: (value) {
              setState(() {
                widget.tasks.forEach((task) => task.isSelected = false);
                widget.tasks[index].isSelected = true;
              });
            },
          ),
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TaskManagementDashboard(),
  ));
}
