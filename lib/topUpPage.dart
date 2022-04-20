import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/NavBar.dart';
import 'package:test/appbar.dart';
import 'package:test/main.dart';

class TopupScreen extends StatefulWidget {
  const TopupScreen({Key? key}) : super(key: key);

  @override
  State<TopupScreen> createState() => _TopupScreenState();
}

class _TopupScreenState extends State<TopupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navbar(),
      //     appBar: appbar,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/image.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Current balance \$${balance}",
                      style: TextStyle(fontSize: 18,color: Colors.white),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: TextField(
                        style: GoogleFonts.roboto(
                            color: Colors.white, fontSize: 24),
                        decoration: const InputDecoration(
                            labelText: "Amount",
                            labelStyle: TextStyle(color: Colors.white),
                            hintText: "Enter Amount",
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            fillColor: Colors.transparent,
                            filled: true),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 70,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text("\$10",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white))),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          width: 70,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text("\$50",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white))),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          width: 70,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text("\$100",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white))),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          width: 70,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text("\$500",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white))),
                        )
                      ],
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
