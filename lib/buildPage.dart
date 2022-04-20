// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:test/buildPayments.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test/buildSheet.dart';
import 'package:test/topup.dart';

import 'buildBalance.dart';
import 'buildCard.dart';
import 'buildIndicator.dart';

Widget buildPage(
  BuildContext context,
  dynamic c,
  String cardType,
  int activeIndex,
) =>
    Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(children: [
        // cards
        GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(35)),
                  ),
                  context: context,
                  builder: (context) => bottomSheet(context));
            },
            child: buildCard(cardType, c, context)),
        //balance
        GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  // isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(35.r),
                        bottom: Radius.circular(35.r)),
                  ),
                  context: context,
                  builder: (context) => Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 15.0.h, horizontal: 15.w),
                      child: topUp(context)));
            },
            child: buildBalance(activeIndex, context)),
      ]),
    );
