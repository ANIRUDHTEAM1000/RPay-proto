import 'package:flutter/material.dart';

Widget buildSheet() => Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          child: const Text(
            "Your card detail",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: const Text(
            "Tap text to copy to clipboard",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          child: Row(
            children: const [
              Expanded(
                  child: Text(
                "Card number",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              )),
              Expanded(
                  child: Text(
                "1234567890123456",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 20, color: Colors.blue),
              )),
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        Container(
          child: Row(
            children: const [
              Expanded(
                  child: Text(
                "Expire on",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              )),
              Expanded(
                  child: Text(
                "12/24",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 20, color: Colors.blue),
              )),
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        Container(
          child: Row(
            children: const [
              Expanded(
                  child: Text(
                "Scurity code",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              )),
              Expanded(
                  child: Text(
                "543",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 20, color: Colors.blue),
              )),
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        Container(
          child: Row(
            children: const [
              Expanded(
                  child: Text(
                "Card holder",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              )),
              Expanded(
                  child: Text(
                "Saily Anderson",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 20, color: Colors.blue),
              )),
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        Container(
          child: Row(
            children: const [
              Expanded(
                  child: Text(
                "Card holder",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              )),
              Expanded(
                  child: Text(
                "Saily Anderson",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 20, color: Colors.blue),
              )),
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: const Text(
            "Renew number",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blue, fontSize: 18),
          ),
        ),
      ]),
    );
