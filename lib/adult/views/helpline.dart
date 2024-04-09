// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpLine extends StatelessWidget {
  static const String id = "HelpLine";

  const HelpLine({super.key});

  _makingPhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
            "Helpline Numbers",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.02),
              ListTile(
                onTap: () => _makingPhoneCall('tel:1091'),
                title: const Text("Women HelpLine"),
                trailing: const Icon(Icons.call),
              ),
              SizedBox(height: screenHeight * 0.02),
              ListTile(
                onTap: () => _makingPhoneCall('tel:100'),
                title: const Text("Police"),
                trailing: const Icon(Icons.call),
              ),
              ListTile(
                onTap: () => _makingPhoneCall('tel:101'),
                title: const Text("Fire Department"),
                trailing: const Icon(Icons.call),
              ),
              SizedBox(height: screenHeight * 0.02),
              ListTile(
                onTap: () => _makingPhoneCall('tel:102'),
                title: const Text("Ambulance"),
                trailing: const Icon(Icons.call),
              ),
              SizedBox(height: screenHeight * 0.02),
              ListTile(
                onTap: () => _makingPhoneCall('tel:103'),
                title: const Text("Medical Emergency"),
                trailing: const Icon(Icons.call),
              ),
              SizedBox(height: screenHeight * 0.02),
              ListTile(
                onTap: () => _makingPhoneCall('tel:104'),
                title: const Text("COVID-19 Helpline"),
                trailing: const Icon(Icons.call),
              ),
              SizedBox(height: screenHeight * 0.02),
              ListTile(
                onTap: () => _makingPhoneCall('tel:105'),
                title: const Text("Poison Control"),
                trailing: const Icon(Icons.call),
              ),
              SizedBox(height: screenHeight * 0.02),
              ListTile(
                onTap: () => _makingPhoneCall('tel:106'),
                title: const Text("Child Helpline"),
                trailing: const Icon(Icons.call),
              ),
              SizedBox(height: screenHeight * 0.02),
              ListTile(
                onTap: () => _makingPhoneCall('tel:107'),
                title: const Text("Natural Disaster Helpline"),
                trailing: const Icon(Icons.call),
              ),
              SizedBox(height: screenHeight * 0.02),
              ListTile(
                onTap: () => _makingPhoneCall('tel:108'),
                title: const Text("Road Accident Emergency"),
                trailing: const Icon(Icons.call),
              ),
              SizedBox(height: screenHeight * 0.02),
              ListTile(
                onTap: () => _makingPhoneCall('tel:110'),
                title: const Text("Electricity Emergency"),
                trailing: const Icon(Icons.call),
              ),
              SizedBox(height: screenHeight * 0.02),
              ListTile(
                onTap: () => _makingPhoneCall('tel:112'),
                title: const Text("General Emergency"),
                trailing: const Icon(Icons.call),
              ),
              SizedBox(height: screenHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
