import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import '../main.dart';

class Balance extends StatefulWidget {
  int activeIndex;
  Balance(this.activeIndex);

  @override
  State<Balance> createState() => _BalanceState(activeIndex);
}

class _BalanceState extends State<Balance> {
  int activeIndex;
  _BalanceState(this.activeIndex);

  @override
  Widget build(BuildContext context) {
    if (activeIndex == 0) {
      return Container(
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Text(
                "Prepaid Balance",
                style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                "\$ $balance",
                style: GoogleFonts.roboto(color: Colors.white, fontSize: 24),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 3, bottom: 3, left: 18, right: 18),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "TOP UP",
                  style: GoogleFonts.roboto(color: Colors.white, fontSize: 11),
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
                children:  [
                  Expanded(
                    child: Text(
                      "Shopping Power",
                      textAlign: TextAlign.right,
                style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      " \$1000.00",
                      textAlign: TextAlign.left,
                   style: GoogleFonts.roboto(color: Colors.white, fontSize: 24),

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
                padding: const EdgeInsets.only(
                    top: 3, bottom: 3, left: 18, right: 18),
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
}

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
