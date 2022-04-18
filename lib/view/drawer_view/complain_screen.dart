import 'package:flutter/material.dart';

class ComplainScreen extends StatefulWidget {
  static const String id = "complain_screen";
  const ComplainScreen({Key? key}) : super(key: key);

  @override
  _ComplainScreenState createState() => _ComplainScreenState();
}

class _ComplainScreenState extends State<ComplainScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("ComplainScreen"),
      ),
    );
  }
}
