import 'package:flutter/material.dart';
import 'package:im_app_student/model/constants.dart';

class NotificationScreen extends StatefulWidget {
  static const String id = "notification_screen";
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: IMColors.primaryColor,
        title: Text("Notification"),
      ),
      body: Container(
        child: Text("Notification"),
      ),
    );
  }
}
