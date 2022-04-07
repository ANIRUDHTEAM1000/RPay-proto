import 'package:flutter/material.dart';
import 'package:rpay_proto/NavBar.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const Navbar(),
      appBar: AppBar(
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
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
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
      ),
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bluesky.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Hello Solution",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {
                    print("hi");
                    showModalBottomSheet(
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(35)),
                        ),
                        context: context,
                        builder: (context) => Column());
                  },
                  child: const Text(
                    "Button",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        )
      ]),
    );
  }
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


























