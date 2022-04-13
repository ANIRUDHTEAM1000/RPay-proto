// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:rpay_proto/main.dart';
import 'package:rpay_proto/screens/loginScreen.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
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
                        Icons.arrow_back,
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
            padding: const EdgeInsets.only(
                left: 15.0, top: 15, right: 15, bottom: 7),
            child: Row(
              children: <Widget>[
                const Text(
                  "Prepaid Debit - ",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "\$$balance",
                  style: const TextStyle(fontSize: 20, color: Colors.blue),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 15.0, right: 15, bottom: 7, top: 7),
            child: Row(
              children: const <Widget>[
                Text(
                  "Installments - ",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "\$0.00",
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 7, bottom: 10),
            child: Row(
              children: const <Widget>[
                Text(
                  "Send Money",
                  style: TextStyle(fontSize: 20),
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
            padding: const EdgeInsets.only(left: 15.0, top: 7, bottom: 10),
            child: Row(
              children: const <Widget>[
                Text(
                  "Cash Back - ",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "\$0.00",
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 7, bottom: 10),
            child: Row(
              children: const <Widget>[
                Text(
                  "Rakuten Points - ",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "0P",
                  style: TextStyle(fontSize: 20, color: Colors.blue),
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
          const SizedBox(
            height: 300,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 7, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const <Widget>[
                Text(
                  "Support ",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8),
            child: Divider(
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
              padding: const EdgeInsets.only(left: 15.0, top: 7, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    "Logout ",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8),
            child: Divider(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
