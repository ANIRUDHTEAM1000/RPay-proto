// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rpay_proto/main.dart';
import 'package:rpay_proto/screens/loginScreen.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                //change to row again
                children: <Widget>[
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: TextButton.styleFrom(primary: Colors.black),
                          child: const Icon(
                            Icons.arrow_back_ios,
                          )),
                    ],
                  ),
                  const Spacer(),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: TextButton.styleFrom(primary: Colors.black),
                          child: const Icon(Icons.notifications_none_outlined),
                        ),
                      ]),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.h, left: 16.w, bottom: 12.h),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Prepaid Debit - ",
                      style:
                          TextStyle(fontSize: 17.sp, fontFamily: '.SF Pro Text'),
                    ),
                    Text(
                      "\$",
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontFamily: '.SF Pro Text',
                          color: Colors.blue),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.h, left: 16.w, bottom: 12.h),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Installments - ",
                      style:
                          TextStyle(fontSize: 17.sp, fontFamily: '.SF Pro Text'),
                    ),
                    Text(
                      "\$0.00",
                      style: TextStyle(
                          fontSize: 17.sp,
                          color: Colors.blue,
                          fontFamily: '.SF Pro Text'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.h, left: 16.w, bottom: 12.h),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Send Money",
                      style:
                          TextStyle(fontSize: 17.sp, fontFamily: '.SF Pro Text'),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.h, left: 16.w, bottom: 12.h),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Cash Back - ",
                      style:
                          TextStyle(fontSize: 17.sp, fontFamily: '.SF Pro Text'),
                    ),
                    Text(
                      "\$0.00",
                      style: TextStyle(
                          fontSize: 17.sp,
                          color: Colors.blue,
                          fontFamily: '.SF Pro Text'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.h, left: 16.w, bottom: 12.h),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Rakuten Points - ",
                      style:
                          TextStyle(fontSize: 17.sp, fontFamily: '.SF Pro Text'),
                    ),
                    Text(
                      "0P",
                      style: TextStyle(
                          fontSize: 17.sp,
                          color: Colors.blue,
                          fontFamily: '.SF Pro Text'),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              Container(
                  child:
                      Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Padding(
                  padding: EdgeInsets.only(top: 12.h, left: 16.w, bottom: 12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Support ",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 17.sp, fontFamily: '.SF Pro Text'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.h, left: 16.w, bottom: 12.h),
                  child: const Divider(
                    color: Colors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: (() {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (BuildContext context) => LoginScreen()),
                        (Route<dynamic> route) => false);
                  }),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15.0, top: 7, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Logout ",
                          style: TextStyle(
                              fontSize: 17.sp, fontFamily: '.SF Pro Text'),
                        ),
                      ],
                    ),
                  ),
                ),
              ])),
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
