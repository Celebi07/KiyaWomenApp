// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ElevatedGradientButton.dart';

class MathChoicePage extends StatelessWidget {
  const MathChoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
      ), //Bungee Spice
      body: Center(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ElevatedGradientButton(
          width: (screenWidth - 50) / 2,
          height: (screenWidth - 50) / 2,
          borderRadius: 25,
          onPressed: () {
            // Pushing a route directly, WITHOUT using a named route
            Navigator.pushNamed(context, '/mathe');
          },
          child: Text(
            '+/-',
            style: GoogleFonts.bungeeSpice(
              fontSize: MediaQuery.of(context).size.height * 0.07,
            ),
          ),
        ),
        ElevatedGradientButton(
          width: (screenWidth - 50) / 2,
          height: (screenWidth - 50) / 2,
          borderRadius: 25,
          onPressed: () {
            // Pushing a route directly, WITHOUT using a named route
            Navigator.pushNamed(context, '/matheComparison');
          },
          child: Text(
            '>/=/<',
            style: GoogleFonts.bungeeSpice(
              fontSize: MediaQuery.of(context).size.height * 0.07,
            ),
          ),
        ),
      ])),
    );
  }
}
