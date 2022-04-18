import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  static const String id = "attendance_screen";
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Attendance"),
      ),
    );
  }
}
