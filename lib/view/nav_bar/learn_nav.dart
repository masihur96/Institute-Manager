import 'package:flutter/material.dart';

class LearnNav extends StatefulWidget {
  const LearnNav({Key? key}) : super(key: key);

  @override
  _LearnNavState createState() => _LearnNavState();
}

class _LearnNavState extends State<LearnNav> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Learn Nav")),
    );
  }
}
