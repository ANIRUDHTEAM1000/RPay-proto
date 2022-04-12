import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rpay_proto/main.dart';
import '../models/transactions.dart';

var current_date;

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  int currentPage = 1;
  late int totalpages;
  List<Transaction> transactions = [];
  List<Transaction> transactionWithDate = [];
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  Future<bool> getTransactionData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalpages) {
        refreshController.loadNoData();
        return true;
      }
    }
    final Uri uri = Uri.parse(
        "http://10.0.2.2:8080/walletengine/get/transactions/anirudh@rakuten.com/$currentPage");

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final result = TransactionsFromJson(response.body);
      if (isRefresh) {
        transactions = result.transactions;
      } else {
        transactions.addAll(result.transactions);
      }
      String currentDate = "";
      transactionWithDate = [];
      for (int i = 0; i < transactions.length; i++) {
        String temp = DateFormat('dd-MM').format(transactions[i].date);
        if (currentDate == "") {
          Transaction t = Transaction(
              amount: 0,
              date: transactions[i].date,
              name: '',
              transactionNumber: '');
          transactionWithDate.add(t);
          currentDate = DateFormat('dd-MM').format(transactions[i].date);
          transactionWithDate.add(transactions[i]);
        } else if (currentDate != temp) {
          Transaction t = Transaction(
              amount: 0,
              date: transactions[i].date,
              name: '',
              transactionNumber: '');
          transactionWithDate.add(t);
          currentDate = DateFormat('dd-MM').format(transactions[i].date);
          transactionWithDate.add(transactions[i]);
        } else {
          transactionWithDate.add(transactions[i]);
        }
      }
      totalpages = result.totalPages;
      currentPage++;
      setState(() {});
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullUp: true,
      controller: refreshController,
      onRefresh: () async {
        await getBalance();
        setState(() {});
        transactionWithDate = [];
        final result = await getTransactionData(isRefresh: true);
        if (result) {
          refreshController.refreshCompleted();
        } else {
          refreshController.refreshFailed();
        }
      },
      onLoading: () async {
        final result = await getTransactionData();
        if (result) {
          refreshController.loadComplete();
        } else {
          refreshController.loadFailed();
        }
      },
      child: ListView.builder(
          itemBuilder: ((context, index) {
            final transaction = transactionWithDate[index];
            String amt;
            if (transaction.amount >= 0) {
              amt = '\$ -' + transaction.amount.toString();
            } else {
              amt = '\$ ' + (transaction.amount * -1).toString();
            }
            String temp = DateFormat('dd-MM').format(transaction.date);
            if (transaction.name == "") {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: Text(
                        conMonth(temp) + ' ' + temp.substring(0, 2),
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
                        "  \$780.00",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  showDialogFunc(context, transaction);
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          transaction.name,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          amt,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
          itemCount: transactionWithDate.length),
    );
  }
}

showDialogFunc(context, transaction) {
  String tdate = DateFormat('MMMM  dd  yyyy').format(transaction.date);
  String amt;
  if (transaction.amount < 0) {
    amt = "\$ " + (transaction.amount * -1).toString();
  } else {
    amt = "\$ " + (transaction.amount).toString();
  }
  print(tdate);
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
              height: MediaQuery.of(context).size.height * 0.6,
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
                    child: Image.asset(
                      "assets/images/applelogo.jpg",
                      width: 200,
                      height: 200,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Transaction details here ",
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Text(
                      transaction.name,
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
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
                    child: Text(
                      amt,
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

String conMonth(String s) {
  String temp = s.substring(3, 5);
  if (temp == "01") {
    return "Jan";
  }
  if (temp == "02") {
    return "Feb";
  }
  if (temp == "03") {
    return "Mar";
  }
  if (temp == "04") {
    return "April";
  }
  if (temp == "05") {
    return "May";
  }
  if (temp == "06") {
    return "June";
  }
  if (temp == "07") {
    return "July";
  }
  if (temp == "08") {
    return "Aug";
  }
  if (temp == "09") {
    return "Sep";
  }
  if (temp == "10") {
    return "Oct";
  }
  if (temp == "11") {
    return "Nov";
  }
  return "Dec";
}
