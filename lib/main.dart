// ignore_for_file: file_names, avoid_unnecessary_containers
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rpay_proto/NavBar.dart';
import 'package:rpay_proto/widgets/buildPayments.dart';
import 'package:rpay_proto/widgets/buildSheet.dart';
import 'package:rpay_proto/widgets/topup.dart';
import 'package:rpay_proto/widgets/buildIndicator.dart';
import 'package:rpay_proto/screens/Payments.dart';
import 'buildBalance.dart';
import 'package:http/http.dart' as http;

String uid = "anirudh@rakuten.com";
dynamic balance;

dynamic getBalance() async {
  var url = "10.0.2.2:8080";
  final response = await http.get(Uri.http(url, "walletengine/balance/" + uid));

  if (response.statusCode == 200) {
    balance = int.parse(response.body.toString());
    return '';
  }
}

void main() async {
  await getBalance();
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = CarouselController();
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
          Text(" 87.35 ",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold))
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
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text("147 Points",
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
  double topMargin = 0;
  int activeIndex = 0;
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
                  child: buildBalance(activeIndex)),
              Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  child: buildIndicator(activeIndex)),
              buildPayments(activeIndex),
              // SingleChildScrollView(child: buildPayments()),
            ],
          ),
        )
      ]),
    );
  }

// widget

  Widget buildPage(dynamic c, String cardType, int activeIndex) =>
      GestureDetector(
        onTap: () {
          print(cardType);
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



// Scaffold(
//         drawer: const Navbar(),
//         extendBodyBehindAppBar: true,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent, // Colors.white.withOpacity(0.1),
//           elevation: 0,
//           title: const Text(
//             "Hello Transperent AppBar with Body",
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//         ),
//         body: Stack(
//           children: [
//             Container(
//               decoration: const BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage("assets/images/bluesky.jpg"),
//                       fit: BoxFit.cover)),
//             ),
//             const Center(child: Text("hi"))
//           ],
//         ));
