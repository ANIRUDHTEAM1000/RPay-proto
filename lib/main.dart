// ignore_for_file: file_names, avoid_unnecessary_containers
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rpay_proto/widgets/NavBar.dart';
import 'package:rpay_proto/screens/loginScreen.dart';
import 'package:rpay_proto/widgets/buildPayments.dart';
import 'package:rpay_proto/widgets/bottomSheet.dart';
import 'package:rpay_proto/widgets/topup.dart';
import 'package:rpay_proto/widgets/buildIndicator.dart';
import 'widgets/appBar.dart';
import 'widgets/buildBalance.dart';
import 'package:http/http.dart' as http;

bool refresh = true;
dynamic uid = "";
dynamic uname = "";
int balance = 0;

dynamic getBalance() async {
  var url = "10.0.2.2:8080";
  final response = await http.get(Uri.http(url, "walletengine/balance/" + uid));

  if (response.statusCode == 200) {
    balance = int.parse(response.body.toString());
    return '';
  }
}

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool refresh = true;
  final controller = CarouselController();
  double topMargin = 0;
  int activeIndex = 0;

  updateBalance() async {
    await getBalance();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    topMargin = appbar.preferredSize.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const Navbar(),
      appBar: appbar,
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bluesky.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: topMargin * 1.7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // 1 carsel builder
              CarouselSlider.builder(
                  carouselController: controller,
                  itemCount: 2,
                  itemBuilder: (context, index, realIndex) {
                    if (index == 0) {
                      return buildPage(
                          Colors.grey.withOpacity(0.3), "Prepaid", activeIndex);
                    } else {
                      return buildPage(Colors.pink.withOpacity(0.3),
                          "Pay Later", activeIndex);
                    }
                  },
                  options: CarouselOptions(
                      enableInfiniteScroll: false,
                      height: 150,
                      onPageChanged: ((index, reason) => {
                            setState(() => {activeIndex = index})
                          }))),
              GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        // isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(35),
                              bottom: Radius.circular(35)),
                        ),
                        context: context,
                        builder: (context) => Container(
                            margin: const EdgeInsets.all(15.0),
                            child: topUp()));
                  },
                  // Balance
                  child: Balance(activeIndex)),

              // build Indicator
              buildIndicator(activeIndex),

              // build Payments
              buildPayments(activeIndex, this),
            ],
          ),
        )
      ]),
    );
  }

// widget carosel

  Widget buildPage(dynamic c, String cardType, int activeIndex) =>
      GestureDetector(
        onTap: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
              ),
              context: context,
              builder: (context) => buildSheet());
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: c,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Expanded(
                child: Row(children: [
                  Container(
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: Center(
                      child: Image.asset(
                        "assets/images/whitebgRakuten-removebg-preview.ico",
                        height: 40,
                        width: 70,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      cardType,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                ]),
              ),
              Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "TAP TO REVEAL",
                        style: TextStyle(color: Colors.white),
                      ),
                    ]),
              ),
              Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        "circle",
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.white),
                      ),
                    ]),
              ),
            ]),
          ),
        ),
      );
}
