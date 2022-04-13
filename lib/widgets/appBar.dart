import 'package:flutter/material.dart';

AppBar appbar = AppBar(
  // title: const Text('Transparent AppBar'),
  // leading: const BackButton(),
  actions: [
    Container(
      margin: const EdgeInsets.all(5.0),
      child: Column(children: const [
        Text(
          "Cash Back",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(" 0 ",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold))
      ]),
    ),
    const VerticalDivider(color: Colors.white),
    GestureDetector(
      onTap: (() => print("Hi")),
      child: Container(
        margin: const EdgeInsets.all(5.0),
        child: Column(children: const [
          Text(
            "Rakuten Points",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text("0 Points",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold))
        ]),
      ),
    ),
  ],
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
  ),
  backgroundColor: Colors.transparent, // Colors.white.withOpacity(0.1),
  elevation: 0,
);
