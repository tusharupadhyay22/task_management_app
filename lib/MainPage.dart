import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'TaskManagemenetDashboard.dart';
import 'TaskManagementAddTask.dart';

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget _currentScreen = Container(); // Default empty container

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Upper screen with gradient container
          Container(
            height: 96,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange.shade200, Colors.orange.shade50],
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        // Icon container
                        Container(
                          margin: EdgeInsets.only(left: 20, top: 10),
                          child: Icon(Icons.close, size: 20),
                        ),
                        //How it works written
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              margin: EdgeInsets.only(right: 20, top: 20),
                              child: Text(
                                "60% Complete",
                                style: GoogleFonts.mulish(
                                    fontSize: 12, color: Color(0xFF394750)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 328,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Container(
                        child: Text(
                          "Edit Profile",
                          style: GoogleFonts.mulish(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
                //Line divider
                Container(
                  margin: EdgeInsets.only(top: 95),
                  height: 20,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: Container(
                          child: Divider(
                            thickness: 2,
                            color: Colors.orange.shade200,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Buttons for Add Task, View Task, Calendar
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentScreen = TaskManagementAddTask();
                    });
                  },
                  child: Text('Add Task'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _currentScreen = TaskManagemenetDashboard();
                    });
                  },
                  child: Text('View Task'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement Calendar screen here
                  },
                  child: Text('Calendar'),
                ),
              ],
            ),
          ),
          // Container to display the current screen
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _currentScreen,
            ),
          ),
        ],
      ),
    );
  }
}




