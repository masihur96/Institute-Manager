import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:im_app_student/model/local_push_notification.dart';

class DeshBoardScreen extends StatefulWidget {
  const DeshBoardScreen({Key? key}) : super(key: key);

  @override
  State<DeshBoardScreen> createState() => _DeshBoardScreenState();
}

class _DeshBoardScreenState extends State<DeshBoardScreen> {
  //updated
  bool isLoading = false;

  storeNotificationToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({'token': token}, SetOptions(merge: true));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen((event) {
      LocalNotificationService.display(event);
    });
    storeNotificationToken();

    FirebaseMessaging.instance.subscribeToTopic('subscription');
  }

  sendNotification(String title, String token) async {
    final data = {
      'click_action': 'FLUTTER_NOTIFICATION_CLICK',
      'id': '1',
      'status': 'done',
      'message': title,
    };

    try {
      http.Response response =
          await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
              headers: <String, String>{
                'Content-Type': 'application/json',
                'Authorization':
                    'key=AAAA0AU-dRY:APA91bGTU4i9BNlbI8nqBZ_qnB9QlvJxwifnT8GpTBcBRS591MfNSovGOhQ36pLXW82mg9jjfGYfBAPKJDXDkPEO8bc3GfpbErU_CGVDXlu5cPGOv2XFU8_ydN_CYP0LvHy4Nz9gTX6r'
              },
              body: jsonEncode(<String, dynamic>{
                'notification': <String, dynamic>{
                  'title': title,
                  'body': 'You are followed by someone'
                },
                'priority': 'high',
                'data': data,
                'to': '$token'
              }));

      if (response.statusCode == 200) {
        print("Yeh notificatin is sended");
      } else {
        print("Error");
      }
    } catch (e) {}
  }

  sendNotificationToTopic(String title) async {
    final data = {
      'click_action': 'FLUTTER_NOTIFICATION_CLICK',
      'id': '1',
      'status': 'done',
      'message': title,
    };

    try {
      http.Response response =
          await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
              headers: <String, String>{
                'Content-Type': 'application/json',
                'Authorization':
                    'key=AAAA7NEUBtQ:APA91bFXJb8RWaNPOwdeu3Ih3Jlb3hvQWjp1eRSxMs2xpMuOcJMdzYQYqZHP82-hYCDErFrrQdfrZ9cGiTlkNKvrgJqmaRrNoVqjPKNx34E76tyqwg2GLrt8cR9qSJveJEn0zxyW6qgY'
              },
              body: jsonEncode(<String, dynamic>{
                'notification': <String, dynamic>{
                  'title': title,
                  'body': 'You are followed by someone'
                },
                'priority': 'high',
                'data': data,
                'to': '/topics/subscription'
              }));

      if (response.statusCode == 200) {
        print("Yeh notificatin is sended");
      } else {
        print("Error");
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sendNotificationToTopic('FLutter Force uploaded a video');
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const CircularProgressIndicator();
                      }
                      List followList = snapshot.data!.get('followId');
                      TextEditingController nameController =
                          TextEditingController(
                        text: snapshot.data!.get('Name'),
                      );
                      TextEditingController emailController =
                          TextEditingController(
                        text: snapshot.data!.get('Email'),
                      );
                      return Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: TextFormField(
                              enabled: false,
                              controller: nameController,
                              decoration: const InputDecoration(
                                labelText: 'UserName',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: TextFormField(
                              enabled: false,
                              controller: emailController,
                              decoration:
                                  const InputDecoration(labelText: 'UserEmail'),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Following : ${followList.length}',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('users')
                                .snapshots(),
                            builder: (context, secSnapshot) {
                              if (!secSnapshot.hasData) {
                                return const CircularProgressIndicator();
                              }

                              return ListView.builder(
                                itemCount: secSnapshot.data!.docs.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, i) {
                                  String? token;
                                  try {
                                    token =
                                        secSnapshot.data!.docs[i].get('token');
                                  } catch (e) {}
                                  User? user =
                                      FirebaseAuth.instance.currentUser;
                                  final docId = secSnapshot.data!.docs[i].id;
                                  return Container(
                                    margin: const EdgeInsets.all(15),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                    ),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              secSnapshot.data!.docs[i]['Name'],
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                                secSnapshot.data!.docs[i]
                                                    ['Email'],
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black45,
                                                ))
                                          ],
                                        ),
                                        const Spacer(),
                                        followList.contains(docId)
                                            ? TextButton(
                                                onPressed: () {
                                                  FirebaseFirestore.instance
                                                      .collection('users')
                                                      .doc(FirebaseAuth.instance
                                                          .currentUser!.uid)
                                                      .set({
                                                    'followId':
                                                        FieldValue.arrayRemove(
                                                            [docId])
                                                  }, SetOptions(merge: true));

                                                  sendNotification(
                                                      'Unfollow', token!);
                                                },
                                                child: const Text(
                                                  'unfollow',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20),
                                                ),
                                              )
                                            : TextButton(
                                                onPressed: () {
                                                  FirebaseFirestore.instance
                                                      .collection('users')
                                                      .doc(FirebaseAuth.instance
                                                          .currentUser!.uid)
                                                      .set({
                                                    'followId':
                                                        FieldValue.arrayUnion(
                                                            [docId])
                                                  }, SetOptions(merge: true));

                                                  sendNotification(
                                                      'follow', token!);
                                                },
                                                child: const Text('follow',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20)),
                                              )
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
