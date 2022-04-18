import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  static const String id = "setting_screen";
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Setting Screen")),
    );
  }
}
