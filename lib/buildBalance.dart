import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test/topUpPage.dart';
import '../main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildBalance(int activeIndex,BuildContext context) {
  print(activeIndex);
  if (activeIndex == 0) {
    return Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Column(
          children: [
            Text(
              "Prepaid Balance",
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "\$ $balance",
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontSize: 24.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 3.h, bottom: 3.h, left: 18.w, right: 18.w),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 1.5.w,
                ),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                "TOP UP",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
            )
          ],
        ));
  } else {
    return Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Shopping Power",
                    textAlign: TextAlign.right,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                
                Expanded(
                  child: Text(
                    " \$1000.00",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 24.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Pay monthly",
                    textAlign: TextAlign.right,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                  child: Text(
                    " \$60.00",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 3.h, bottom: 3.h, left: 18.w, right: 18.w),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 1.5.w,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TopupScreen()),
                  );
                },
                child: Text(
                  "DETAIL",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
