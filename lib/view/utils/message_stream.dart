import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_app_student/view/utils/message_bubble.dart';

class RechargeMessageStream extends StatefulWidget {
  String? followingName, followingNumber, followerName, followerNumber, sender;

  RechargeMessageStream(
      {this.followingName,
      this.followingNumber,
      this.followerName,
      this.followerNumber,
      this.sender});

  @override
  _RechargeMessageStreamState createState() => _RechargeMessageStreamState();
}

class _RechargeMessageStreamState extends State<RechargeMessageStream> {
  final _firestore = FirebaseFirestore.instance;
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection(
              'Chats/${widget.followerNumber} ${widget.followingNumber}/messages')
          .orderBy('timestamp', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data!.docs;
        List<RechargeMessageBubble> messageBubbles = [];
        for (var message in messages) {
          final messageText = message.get('text');
          final sender = message.get('sender');
          final senderName = message.get('senderName');
          final follower = message.get('follower');
          final following = message.get('following');
          final time = message.get('timestamp');

          final messageBubble = RechargeMessageBubble(
            sender: senderName,
            text: messageText,
            isMe: sender == widget.sender ? true : false,
            time: time,
          );

          messageBubbles.add(messageBubble);
        }
        return Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 10, bottom: 90),
                reverse: true,
                children: messageBubbles,
              ),
            ),
          ],
        );
      },
    );
  }
}
