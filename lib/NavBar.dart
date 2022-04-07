// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        //     child: ListView(
        //   children: [
        //     ListTile(
        //       leading: const Icon(Icons.backspace),
        //       title: const Icon(Icons.backspace),
        //       onTap: () {
        //         Navigator.of(context).pushNamed(
        //             "/qrcodepage" /* Name of the page from the routes used  */); //try to show my qr code ;
        //       },
        //     ),
        //     ListTile(
        //       leading: const Icon(Icons.qr_code),
        //       title: const Text("My QR"),
        //       onTap: () {
        //         Navigator.of(context).pushNamed(
        //             "/qrcodepage" /* Name of the page from the routes used  */); //try to show my qr code ;
        //       },
        //     ),
        //     ListTile(
        //       title: const Text("Turn off access to wallet"),
        //       onTap: () {
        //         Navigator.of(context).pushNamed(
        //             "/SetPassCode" /* Name of the page from the routes used  */); //try to show my qr code ;
        //       },
        //     ),
        //     ListTile(
        //       leading: const Icon(Icons.logout),
        //       title: const Text("Logout"),
        //       onTap: () {
        //         Navigator.popUntil(context, ModalRoute.withName('/HomeScreen'));
        //       },
        //     ),
        //   ],
        // )
        );
  }
}
