import 'package:flutter/material.dart';

class NotificationBadege extends StatelessWidget {
  final int totalNotification;
  const NotificationBadege({Key? key, required this.totalNotification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.orange,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          "$totalNotification",
        ),
      ),
    );
  }
}
