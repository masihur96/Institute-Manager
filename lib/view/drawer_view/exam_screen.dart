import 'package:flutter/material.dart';

class ExamScreen extends StatefulWidget {
  static const String id = "exam_screen";
  const ExamScreen({Key? key}) : super(key: key);

  @override
  _ExamScreenState createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Exam")));
  }
}
