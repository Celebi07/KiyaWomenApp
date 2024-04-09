// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiya/child/ChildStudy/ElevatedGradientButton.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFEEE2DC),
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
        child: AppBar(
          backgroundColor: const Color(0xFFEDC7B7),
          elevation: 0,
          title: Text(
            "Learn Mathematics",
            style: GoogleFonts.kanit(
              fontSize: MediaQuery.of(context).size.height * 0.025,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Center(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ElevatedGradientButton(
          width: screenHeight * 0.3,
          height: screenHeight * 0.3,
          borderRadius: screenHeight * 0.03,
          onPressed: () {
            // Pushing a route directly, WITHOUT using a named route
            Navigator.pushNamed(context, '/matheChoice');
          },
          child: Text(
            'MATHS',
            style: GoogleFonts.bungeeSpice(
              fontSize: MediaQuery.of(context).size.height * 0.07,
            ),
          ),
        ),
      ])),
    );
  }
}
