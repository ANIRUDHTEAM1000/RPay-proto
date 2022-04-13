import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

import '../screens/Payments.dart';

Widget buildPayments(activeIndex) {
  if (activeIndex == 0) {
    return Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10.0),
                  width: double.infinity,
                  child: const Text("Payment history",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Expanded(child: Container(child: Transactions())),
              ],
            )));
  } else {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Installment Activity",
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: const Text(
                        "Active",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    const Expanded(
                        child: DottedLine(
                      dashColor: Colors.white,
                    )),
                    Container(
                      child: const Text(
                        "  \$0.00",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const <Widget>[
                    Expanded(
                      child: Text(
                        "Apple Store",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        " Monthly \$30.00",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const <Widget>[
                    Expanded(
                      child: Text(
                        "Bose Store",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        " Monthly \$30.00",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: const Text(
                        "Ended",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    const Expanded(
                        child: DottedLine(
                      dashColor: Colors.white,
                    )),
                    Container(
                      child: const Text(
                        "  \$0.00",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const <Widget>[
                    Expanded(
                      child: Text(
                        "Bose Store",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        " Monthly \$30.00",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
