import 'package:flutter/material.dart';

import 'main.dart';

Widget buildBalance(int activeIndex) {
  if (activeIndex == 0) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            const Text(
              "Prepaid Balance",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 2,
            ),
             Text(
              "\$ $balance",
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding:
                  const EdgeInsets.only(top: 3, bottom: 3, left: 18, right: 18),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "TOP UP",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            )
          ],
        ));
  } else {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              children: const [
                Expanded(
                  child: Text(
                    "Shopping Power",
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                Expanded(
                  child: Text(
                    " \$1000.00",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: const [
                Expanded(
                  child: Text(
                    "Pay monthly",
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                Expanded(
                  child: Text(
                    " \$60.00",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding:
                  const EdgeInsets.only(top: 3, bottom: 3, left: 18, right: 18),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "DETAIL",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            )
          ],
        ));
  }
}
