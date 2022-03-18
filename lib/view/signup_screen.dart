import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:im_app_student/controller/auth_controller.dart';
import 'package:im_app_student/view/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  AuthController? authController;
  @override
  void initState() {
    super.initState();
    authController = Get.put(AuthController());
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: namecontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Requred';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: emailcontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Requred';
                    }
                    if (!value.contains('@')) {
                      return 'enter valid email';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordcontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Requred';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }

                    authController!.CreateMyUser(
                      email: emailcontroller.text.trim(),
                      password: passwordcontroller.text.trim(),
                      name: namecontroller.text.trim(),
                    );
                  },
                  child: Text('Create Account'),
                ),
                MaterialButton(
                  onPressed: () {
                    Get.to(() => LoginScreen());
                  },
                  child: Text('Already have account'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
