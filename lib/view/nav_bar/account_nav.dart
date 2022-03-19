import 'package:flutter/material.dart';

class AccountNav extends StatefulWidget {
  const AccountNav({Key? key}) : super(key: key);

  @override
  _AccountNavState createState() => _AccountNavState();
}

class _AccountNavState extends State<AccountNav> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Account Nav")),
    );
  }
}
