// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiya/adult/data/techniques.dart';
import 'package:kiya/adult/model/techniqueModel.dart';
import 'package:kiya/adult/widgets/techniqueWidget.dart';

class SelfDefenceTechniques extends StatefulWidget {
  static const String id = "SelfDefenceTechniques";

  const SelfDefenceTechniques({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _SelfDefenceTechniquesState createState() => _SelfDefenceTechniquesState();
}

class _SelfDefenceTechniquesState extends State<SelfDefenceTechniques> {
  List<Technique> _techniques = <Technique>[];

  @override
  void initState() {
    _techniques = getTechniques();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final Size screenSize = MediaQuery.of(context).size;

    final double itemWidth = screenSize.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFEEE2DC),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.07),
        child: AppBar(
          backgroundColor: const Color(0xFFEDC7B7),
          elevation: 0,
          title: Text(
            "Self Defence Techniques",
            style: GoogleFonts.kanit(
              fontSize: screenHeight * 0.025, // Adjust font size as needed
              color: const Color.fromARGB(255, 0, 0, 0), // Set color to desired value
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
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: itemWidth * 0.02),
        itemCount: _techniques.length,
        itemBuilder: (context, index) {
          return TechniqueWidget(
            key: UniqueKey(), // Add key here
            techniques: _techniques,
            index: index,
          );
        },
      ),
    );
  }
}
