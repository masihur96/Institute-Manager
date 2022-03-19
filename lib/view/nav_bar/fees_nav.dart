import 'package:flutter/material.dart';

class FeesNav extends StatefulWidget {
  const FeesNav({Key? key}) : super(key: key);

  @override
  _FeesNavState createState() => _FeesNavState();
}

class _FeesNavState extends State<FeesNav> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Fees Nav")),
    );
  }
}
