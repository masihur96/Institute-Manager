import 'package:flutter/material.dart';

class AVLColors {
  static const Color primaryColor = Color(0xFF20252B);
  static const Color secondaryColor = Color(0xFF949292);
  static const Color facebookButtonColor = Color(0xFF3B5998);
  static const Color googleButtonColor = Color(0xFF4285F4);
  static const Color white = Colors.white;
}

class AVLTextStyle {
  static const TextStyle avlHeader = TextStyle(
    fontWeight: FontWeight.w900,
    fontFamily: "Roboto",
    fontSize: 13,
    color: AVLColors.primaryColor,
  );

  static const TextStyle avlSubHeader = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 12,
    fontFamily: "Roboto",
    color: AVLColors.secondaryColor,
  );

  static const TextStyle avlBodytext = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 10,
    fontFamily: "Roboto",
    color: AVLColors.secondaryColor,
  );

  static const TextStyle testFormLettering = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    fontFamily: "Roboto",
    color: AVLColors.secondaryColor,
  );

  static const TextStyle buttonText = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 12,
    fontFamily: "Roboto",
    color: Colors.white,
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
