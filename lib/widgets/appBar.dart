import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar appbar = AppBar(
  // title: const Text('Transparent AppBar'),
  // leading: const BackButton(),
  actions: [
    Column(children: [
      Text("Cash Back",
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
                fontSize: 12.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          )),
      Text("\$ 0 ",
          style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)))
    ]),
    VerticalDivider(
      color: Colors.white,
      endIndent: 20.0.h,
      thickness: 1.sp,
    ),
    GestureDetector(
      onTap: (() => print("Hi")),
      child: Column(children: [
        SizedBox(
          child: Text("Rakuten Points",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
        ),
        SizedBox(
          child: Text("0 Points",
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
        ),
      ]),
    ),
    SizedBox(
      width: 8.0.w,
    )
  ],
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
  ),
  backgroundColor: Colors.transparent, // Colors.white.withOpacity(0.1),
  elevation: 0,
);
