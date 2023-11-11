import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: TaskManagementDashboard(),
  ));
}

class Task {
  String name;
  bool isSelected;

  Task(this.name, this.isSelected);
}

class TaskManagementDashboard extends StatefulWidget {
  @override
  State<TaskManagementDashboard> createState() => _TaskManagementDashboardState();
}

class _TaskManagementDashboardState extends State<TaskManagementDashboard> {
  List<Task> tasks = [];

  void addTask(String taskName) {
    setState(() {
      tasks.add(Task(taskName, false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Management Dashboard'),
      ),
      body: TaskList(tasks: tasks),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskManagementAddTask(addTask),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
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

class TaskManagementAddTask extends StatefulWidget {
  final Function(String) addTaskCallback;

  TaskManagementAddTask(this.addTaskCallback);

  @override
  State<TaskManagementAddTask> createState() => _TaskManagementAddTaskState();
}

class _TaskManagementAddTaskState extends State<TaskManagementAddTask> {
  TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                hintText: 'Enter upcoming task',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String taskName = _taskController.text.trim();
                if (taskName.isNotEmpty) {
                  widget.addTaskCallback(taskName);
                  Navigator.pop(context); // Close the current screen
                }
              },
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
