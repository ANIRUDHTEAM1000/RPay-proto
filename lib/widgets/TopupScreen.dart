import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rpay_proto/widgets/NavBar.dart';

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
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios_new,
        ),
        backgroundColor: Colors.transparent,
        
      ),
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
              child: Container(
                child: TextField(
                  style: GoogleFonts.roboto(color: Colors.white, fontSize: 24),
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
                  // inputFormatters: <TextInputFormatter>[
                  //   FilteringTextInputFormatter.digitsOnly,
                  // ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
