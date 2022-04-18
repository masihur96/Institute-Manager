import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:im_app_student/model/local_push_notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:im_app_student/view/drawer_view/attendence_screan.dart';
import 'package:im_app_student/view/drawer_view/comment_box.dart';
import 'package:im_app_student/view/drawer_view/complain_screen.dart';
import 'package:im_app_student/view/drawer_view/exam_screen.dart';
import 'package:im_app_student/view/drawer_view/notice_board_screen.dart';
import 'package:im_app_student/view/drawer_view/settings_screen.dart';
import 'package:im_app_student/view/home_screen.dart';
import 'package:im_app_student/view/login_screen.dart';
import 'package:im_app_student/view/nav_bar/chat_screen.dart';
import 'package:im_app_student/view/notification_screen.dart';
import 'package:im_app_student/view/welcome_screen.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  print("Handling a background message: ${message.messageId}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  LocalNotificationService.initialize();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: IMLoginScreen.id,
      routes: {
        IMLoginScreen.id: (context) => const IMLoginScreen(),
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        NoticeBoard.id: (context) => const NoticeBoard(),
        ExamScreen.id: (context) => const ExamScreen(),
        AttendanceScreen.id: (context) => const AttendanceScreen(),
        ComplainScreen.id: (context) => const ComplainScreen(),
        CommentBoxScreen.id: (context) => const CommentBoxScreen(),
        SettingScreen.id: (context) => const SettingScreen(),
        NotificationScreen.id: (context) => const NotificationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
