import 'package:flutter/material.dart';

class IMColors {
  static const Color primaryColor = Color(0xFF8205f7);
  static const Color secondaryColor = Color(0xFFccf381);
  static const Color greyColor = Color(0xFF373A36);
  static const Color googleButtonColor = Color(0xFF4285F4);
  static const Color white = Colors.white;
  static const Color red = Colors.redAccent;
}

class IMTextStyle {
  static const TextStyle IMHeader = TextStyle(
    fontWeight: FontWeight.w900,
    fontFamily: "Typography",
    fontSize: 30,
    color: IMColors.primaryColor,
  );
  static const TextStyle IMHeaderWhite = TextStyle(
    fontWeight: FontWeight.w900,
    fontFamily: "Typography",
    fontSize: 30,
    color: IMColors.white,
  );

  static const TextStyle IMSubHeader = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    fontFamily: "Roboto",
    color: IMColors.greyColor,
  );
  static const TextStyle IMSubHeaderSecondery = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    fontFamily: "Roboto",
    color: IMColors.secondaryColor,
  );
  static const TextStyle IMSubHeaderWhite = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    fontFamily: "Roboto",
    color: IMColors.white,
  );

  static const TextStyle IMBodytext = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    fontFamily: "Roboto",
    color: IMColors.greyColor,
  );
  static const TextStyle IMBodytextWhite = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    fontFamily: "Roboto",
    color: IMColors.white,
  );

  static const TextStyle testFormLettering = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    fontFamily: "Roboto",
    color: IMColors.greyColor,
  );

  static const TextStyle buttonText = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
    fontFamily: "Roboto",
    color: IMColors.primaryColor,
  );
}

const Icon backButton = Icon(
  Icons.arrow_back_ios,
  color: Colors.black,
  size: 20,
);
const Icon menuButton = Icon(
  Icons.menu_outlined,
  color: Colors.black,
  size: 20,
);
