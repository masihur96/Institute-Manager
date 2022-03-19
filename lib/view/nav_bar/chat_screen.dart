import 'package:flutter/material.dart';
import 'package:im_app_student/model/constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Chat With Teacher",
            style: IMTextStyle.IMSubHeaderWhite,
          ),
          backgroundColor: IMColors.primaryColor,
        ),
        body: Center(child: Text("Chat Screen")));
  }
}
