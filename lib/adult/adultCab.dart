// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:google_fonts/google_fonts.dart';

class Cab {
  final String name;
  final String type;
  final String price;
  final bool isAC;
  final String driverName;

  Cab(this.name, this.type, this.price, this.isAC, this.driverName);
}

class AdultCab extends StatefulWidget {
  const AdultCab({super.key});

  @override
  State<AdultCab> createState() => _AdultCabState();
}

class _AdultCabState extends State<AdultCab> {
  final List<Cab> availableCabs = [];

  Cab? selectedCab;

  TextEditingController pickupController = TextEditingController();
  TextEditingController dropController = TextEditingController();

  bool isSearching = false;

  void searchCabs() {
    setState(() {
      isSearching = true;
    });

    _generateCabs(); // Immediately generate cab details

    setState(() {
      isSearching = false;
    });
  }

  void _generateCabs() {
    Random random = Random();
    int numberOfCabs = random.nextInt(3) + 5; // Random number between 5 and 7
    availableCabs.clear(); // Clear existing cabs
    for (int i = 0; i < numberOfCabs; i++) {
      // Generating random cab details
      String name = _generateName();
      String type = _generateType();
      String price = '\$${random.nextInt(50) + 10}';
      bool isAC = random.nextBool();
      String driverName = _generateDriverName();
      availableCabs.add(Cab(name, type, price, isAC, driverName));
    }
  }

  String _generateName() {
    List<String> names = [
      'Toyota Prius',
      'Ford Fiesta',
      'Honda Fit',
      'Chevrolet Spark',
      'BMW i3'
    ];
    return names[Random().nextInt(names.length)];
  }

  String _generateType() {
    List<String> types = ['Mini', 'Micro', 'Luxury'];
    return types[Random().nextInt(types.length)];
  }

  String _generateDriverName() {
    List<String> names = ['Trishika', 'Disha', 'Diya', 'Aisha', 'Jasmine'];

    return names[Random().nextInt(names.length)];
  }

  void bookCab(Cab cab) {
    setState(() {
      selectedCab = cab;
    });

    // Display booking confirmation
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFEEE2DC), // Change background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0), // Change border radius
          ),
          title: const Text(
            'Booking Confirmed',
            style: TextStyle(color: Color(0xFF123C69), fontFamily: 'Roboto'),
          ),
          content: Text(
            'Your cab is booked. Estimated time to reach destination: ${_generateTime()} minutes.',
            style:
                const TextStyle(color: Color(0xFFAC3B61), fontFamily: 'Roboto'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style:
                    TextStyle(color: Color(0xFF123C69), fontFamily: 'Roboto'),
              ),
            ),
          ],
        );
      },
    );

    setState(() {
      selectedCab = null;
    });
  }

  String _generateTime() {
    Random random = Random();
    return (random.nextInt(6) + 5).toString(); // Random number between 5 and 10
  }

  Widget _buildCabCard(Cab cab) {
    return Card(
      margin: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.15,
          MediaQuery.of(context).size.width * 0.05,
          MediaQuery.of(context).size.width * 0.15,
          MediaQuery.of(context).size.width * 0.05),
      elevation: 5,
      shadowColor: Colors.grey.withOpacity(0.9),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width * 0.09),
      ),
      color: const Color(0xFFEEE2DC),
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              cab.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width *
                    0.05, // Adjust font size using MediaQuery
                fontWeight: FontWeight.bold,
                color: const Color(0xFF123C69),
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.005), // Use MediaQuery for consistent sizing
            Text(
              'Type: ${cab.type}',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color(0xFFAC3B61)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.005),
            Text(
              'Price: ${cab.price}',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color(0xFFAC3B61)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.005),
            Text(
              'AC: ${cab.isAC ? 'Yes' : 'No'}',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color(0xFFAC3B61)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.005),
            Text(
              'Driver: ${cab.driverName}',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color(0xFFAC3B61)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            ElevatedButton(
              onPressed: () {
                bookCab(cab);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF606060),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height * 0.02),
                ),
              ),
              child: Text(
                'Book',
                style: GoogleFonts.tiltNeon(
                  textStyle: TextStyle(
                    color: const Color(0xFFFFFFFF),
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.4), // Shadow color
                        blurRadius: 2, // Blur radius
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFEEE2DC),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.07),
        child: AppBar(
          backgroundColor: const Color(0xFFEDC7B7),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: screenWidth * 0.001),
            Text(
              'Book your Ride',
              style: TextStyle(
                fontSize: screenHeight * 0.025, // Adjust font size as needed
                fontWeight: FontWeight.bold, // Optionally adjust font weight
                color: const Color(0xFF123C69), // Optionally adjust text color
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            //  final double borderRadiusValue = MediaQuery.of(context).size.height * 0.09;

            TextField(
              controller: pickupController,
              decoration: InputDecoration(
                labelText: 'Pickup Location',
                labelStyle: const TextStyle(
                    color: Color(0xFFAC3B61)), // Label text color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenHeight * 0.09),
                  borderSide: const BorderSide(
                      color: Color(0xFF848383),
                      width: 2.0), // Border color and thickness
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenHeight * 0.09),
                  borderSide: const BorderSide(
                      color: Color(0xFF848383),
                      width: 2.0), // Focused border color and thickness
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenHeight * 0.09),
                  borderSide: const BorderSide(
                      color: Color(0xFF848383),
                      width: 2.0), // Enabled border color and thickness
                ),
                prefixIcon: const Icon(Icons.location_on,
                    color: Color(0xFFBAB2B5)), // Prefix icon color
              ),
              cursorColor: const Color(0xFFBAB2B5), // Cursor color
            ),

            SizedBox(height: screenHeight * 0.03),
            TextField(
              controller: dropController,
              decoration: InputDecoration(
                labelText: 'Drop Location',
                labelStyle: const TextStyle(
                    color: Color(0xFFAC3B61)), // Label text color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenHeight * 0.09),
                  borderSide: const BorderSide(
                      color: Color(0xFF848383),
                      width: 2.0), // Border color and thickness
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenHeight * 0.09),
                  borderSide: const BorderSide(
                      color: Color(0xFF848383),
                      width: 2.0), // Focused border color and thickness
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenHeight * 0.09),
                  borderSide: const BorderSide(
                      color: Color(0xFF848383),
                      width: 2.0), // Enabled border color and thickness
                ),
                prefixIcon: const Icon(Icons.location_on,
                    color: Color(0xFFBAB2B5)), // Prefix icon color
              ),
              cursorColor: const Color(0xFFBAB2B5), // Cursor color
            ),
            SizedBox(height: screenHeight * 0.03),
            SizedBox(
              width: screenHeight / 90000,
              height: screenHeight * 0.065,
              child: Material(
                elevation: 8, // Change the elevation as needed
                shadowColor: Colors.grey, // Change the shadow color as needed
                borderRadius: BorderRadius.all(
                  Radius.circular(screenWidth * 0.1),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (pickupController.text.isNotEmpty &&
                        dropController.text.isNotEmpty) {
                      searchCabs();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:
                            Text('Please enter both pickup and drop locations'),
                      ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFFBAB2B5), // Set the background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(screenWidth * 0.1),
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Search for Cabs',
                      style: GoogleFonts.tiltNeon(
                        textStyle: TextStyle(
                          color: const Color(0xFF123C69),
                          fontSize: screenWidth * 0.08,
                          shadows: [
                            Shadow(
                              color:
                                  Colors.black.withOpacity(0.4), // Shadow color
                              blurRadius: 2, // Blur radius
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            if (isSearching)
              const Text(
                'Searching...',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            if (!isSearching &&
                pickupController.text.isNotEmpty &&
                dropController.text.isNotEmpty)
              if (availableCabs.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: availableCabs.length,
                    itemBuilder: (context, index) {
                      final cab = availableCabs[index];
                      return _buildCabCard(cab);
                    },
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: AdultCab(),
  ));
}
