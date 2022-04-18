import 'package:flutter/material.dart';

class CommentBoxScreen extends StatefulWidget {
  static const String id = "comment_box_screen";
  const CommentBoxScreen({Key? key}) : super(key: key);

  @override
  _CommentBoxScreenState createState() => _CommentBoxScreenState();
}

class _CommentBoxScreenState extends State<CommentBoxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Comment Box"),
      ),
    );
  }
}
