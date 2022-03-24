import 'package:flutter/material.dart';
import 'package:im_app_student/model/custom_widget/fees_card.dart';

class FeesNav extends StatefulWidget {
  const FeesNav({Key? key}) : super(key: key);

  @override
  _FeesNavState createState() => _FeesNavState();
}

class _FeesNavState extends State<FeesNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: const [
              FeesCard(
                  fessTitle: "Admission Fee",
                  fessAmount: "1500",
                  fessStatus: "Paid"),
              FeesCard(
                  fessTitle: "Tution Fee",
                  fessAmount: "1200",
                  fessStatus: "Discouse"),
              FeesCard(
                  fessTitle: "Exam Fee",
                  fessAmount: "300",
                  fessStatus: "Unpaid"),
              FeesCard(
                  fessTitle: "Tour Fee", fessAmount: "600", fessStatus: "Paid"),
              FeesCard(
                  fessTitle: "Jolsha Fee",
                  fessAmount: "500",
                  fessStatus: "Unpaid"),
              FeesCard(
                  fessTitle: "Sports events Fee",
                  fessAmount: "200",
                  fessStatus: "Discouse"),
            ],
          ),
        ),
      ),
    );
  }
}
