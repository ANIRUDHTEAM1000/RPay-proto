import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rpay_proto/NavBar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          margin: EdgeInsets.only(top: topMargin * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CarouselSlider.builder(
                  itemCount: 2,
                  itemBuilder: (context, index, realIndex) {
                    return buildPage('data', index);
                  },
                  options: CarouselOptions(
                      onPageChanged: ((index, reason) => {
                            setState(() => {activeIndex = index})
                          }))),
              buildBalance(),
              buildIndicator(),
              buildTransaction(),
            ],
          ),
        )
      ]),
    );
  }

  Widget buildBalance() {
    if (activeIndex == 0) {
      return Container(
        child: const Center(
            child: Text(
          "balance 1",
          style: TextStyle(color: Colors.white),
        )),
      );
    } else {
      return Container(
        child: const Center(
            child: Text(
          "Balance 2",
          style: TextStyle(color: Colors.white),
        )),
      );
    }
  }

  Widget buildTransaction() {
    if (activeIndex == 0) {
      return Container(
        child: const Center(
            child: Text(
          "Transaction 1",
          style: TextStyle(color: Colors.white),
        )),
      );
    } else {
      return Container(
        child: const Center(
            child: Text(
          "Transaction 2",
          style: TextStyle(color: Colors.white),
        )),
      );
    }
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 2,
        effect: const JumpingDotEffect(
            activeDotColor: Colors.white, dotColor: Colors.grey),
      );

  Widget buildPage(String a, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        color: Colors.grey.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Expanded(
              child: Row(children: const [
                Expanded(
                  child: Text(
                    "Rakuten",
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Prepaid",
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ]),
            ),
            Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "TAP TO REVEL",
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
      );
}

// showModalBottomSheet(
//                         isScrollControlled: true,
//                         shape: const RoundedRectangleBorder(
//                           borderRadius: BorderRadius.vertical(
//                               top: Radius.circular(35),
//                               bottom: Radius.circular(35)),
//                         ),
//                         context: context,
//                         builder: (context) => topUp());
//                   },

Widget topUp() => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const SizedBox(
          height: 25,
        ),
        Container(
          child: const Text(
            "Somnath your card",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          child: Row(
            children: const [
              Icon(
                Icons.favorite,
                color: Colors.black,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              SizedBox(
                width: 25,
              ),
              Expanded(
                  child: Text(
                "Credit/Debit  card",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, color: Colors.black),
              )),
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        Container(
          child: Row(
            children: const [
              Icon(
                Icons.favorite,
                color: Colors.black,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              SizedBox(
                width: 25,
              ),
              Expanded(
                  child: Text(
                "Bank",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, color: Colors.black),
              )),
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        Container(
          child: Row(
            children: const [
              Icon(
                Icons.favorite,
                color: Colors.black,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              SizedBox(
                width: 25,
              ),
              Expanded(
                  child: Text(
                "PayPal",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, color: Colors.black),
              )),
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        Container(
          child: Row(
            children: const [
              Icon(
                Icons.favorite,
                color: Colors.black,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              SizedBox(
                width: 25,
              ),
              Expanded(
                  child: Text(
                "Cash Back",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, color: Colors.black),
              )),
              Text(
                "\$87.35",
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.blue, fontSize: 20),
              )
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        const SizedBox(
          height: 100,
        ),
      ]),
    );

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
          child: const Text(
            "Your card detail",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ]),
    );

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
