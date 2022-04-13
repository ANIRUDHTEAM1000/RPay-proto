import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

showDialogFunc(context, transaction) {
  String tdate = DateFormat('MMMM  dd  yyyy').format(transaction.date);
  String amt;
  String debitOrCredit;
  if (transaction.amount < 0) {
    amt = "\$" + (transaction.amount * -1).toString();
    debitOrCredit = "Received From : ";
  } else {
    amt = "\$" + (transaction.amount).toString();
    debitOrCredit = "Paid To : ";
  }
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              padding: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.45,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        tdate,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      const Expanded(
                          child: DottedLine(
                        dashColor: Colors.blue,
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Icon(
                        Icons.account_circle_rounded,
                        size: 100.0,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Transaction details here ",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          debitOrCredit,
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        Text(
                          transaction.name,
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Text(
                      "Transaction Number:",
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black, fontSize: 14.0),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Text(
                      transaction.transactionNumber,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black, fontSize: 10.0),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Amount : ",
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                        Text(
                          amt,
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
