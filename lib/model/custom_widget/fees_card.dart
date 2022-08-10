import 'package:flutter/material.dart';
import 'package:im_app_student/model/constants.dart';

class FeesCard extends StatelessWidget {
  const FeesCard({Key? key, this.fessTitle, this.fessAmount, this.fessStatus})
      : super(key: key);
  final fessTitle;
  final fessAmount;
  final fessStatus;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: fessStatus! == "Paid"
          ? IMColors.primaryColor.withAlpha(150)
          : fessStatus! == "Unpaid"
              ? IMColors.red.withAlpha(150)
              : IMColors.googleButtonColor.withAlpha(100),
      elevation: 10,
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      fessTitle,
                      style: IMTextStyle.IMHeaderWhite,
                    ),
                    CircleAvatar(
                      backgroundColor: IMColors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Image.asset(
                          fessStatus! == "Paid"
                              ? 'assets/images/paid_icon.png'
                              : fessStatus! == "Unpaid"
                                  ? 'assets/images/unpaid_icon.png'
                                  : 'assets/images/concider_icon.png',
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        ' Book No: 96',
                        style: IMTextStyle.IMSubHeaderWhite,
                      ),
                      Text(
                        "Recite No:1996",
                        style: IMTextStyle.IMSubHeaderWhite,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Text(
                    "$fessAmount tk",
                    style: IMTextStyle.IMHeaderWhite,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Text(
                      fessStatus! == "Paid"
                          ? 'Thanks For Paying'
                          : fessStatus! == "Unpaid"
                              ? 'Please Pay your balance'
                              : 'Pay within 28 days',
                      style: IMTextStyle.IMSubHeaderSecondery,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              right: -10,
              top: 0,
              bottom: 0,
              child: CircleAvatar(
                backgroundColor: fessStatus! == "Paid"
                    ? IMColors.primaryColor.withAlpha(150)
                    : fessStatus! == "Unpaid"
                        ? IMColors.red.withAlpha(150)
                        : IMColors.googleButtonColor.withAlpha(100),
                child: Padding(
                  padding: EdgeInsets.all(1.0),
                  child: CircleAvatar(
                    backgroundColor: IMColors.white,
                    child: Icon(
                      Icons.double_arrow_outlined,
                      size: 40,
                      color: fessStatus! == "Paid"
                          ? IMColors.primaryColor.withAlpha(150)
                          : fessStatus! == "Unpaid"
                              ? IMColors.red.withAlpha(150)
                              : IMColors.googleButtonColor.withAlpha(100),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
