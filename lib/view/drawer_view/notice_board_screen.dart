import 'package:flutter/material.dart';

class NoticeBoard extends StatefulWidget {
  static const String id = "notice_board_screen";
  const NoticeBoard({Key? key}) : super(key: key);

  @override
  _NoticeBoardState createState() => _NoticeBoardState();
}

class _NoticeBoardState extends State<NoticeBoard> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("Notice Board")));
  }
}
