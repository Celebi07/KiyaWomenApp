// ignore_for_file: file_names

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  static const String id = "HomePage";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image with Blur Effect
          Lottie.asset(
            'assets/images/splash/8.json',
            fit: BoxFit.cover,
            width: double.maxFinite,
            height: double.maxFinite,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.06), // Top spacing
              // Back Arrow
              Padding(
                padding: EdgeInsets.all(screenHeight * 0.02),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(
                        context); // Navigate back to the previous page
                  },
                  child: Icon(Icons.arrow_back_ios_new_rounded,
                      size: screenHeight * 0.04, color: Colors.white),
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Buttons with Spacing and Responsive Design
                      SizedBox(
                        width: screenWidth * 0.7,
                        child: Column(
                          children: [
                            SizedBox(
                              width: screenHeight *
                                  0.5, // Set button width to match parent
                              height: screenWidth * 0.13, // Set button height
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors
                                      .white, // Set button background color to white
                                  elevation: 30, // Add 3D effect
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        screenWidth *
                                            0.09), // Set button border radius
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context,
                                      '/selfDefenceTips'); // Navigate to '/selfDefenceTips' route
                                },
                                child: Text(
                                  "Self Defence Tips",
                                  style: TextStyle(
                                    color:
                                        Colors.black, // Set text color to black
                                    fontSize: screenWidth *
                                        0.05, // Set text font size
                                    fontWeight:
                                        FontWeight.bold, // Set text font weight
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                height: screenWidth *
                                    0.09), // Spacing between buttons
                            SizedBox(
                              width: screenHeight *
                                  0.5, // Set button width to match parent
                              height: screenWidth * 0.13, // Set button height
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors
                                      .white, // Set button background color to white
                                  elevation: 30, // Add 3D effect
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        screenWidth *
                                            0.09), // Set button border radius
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context,
                                      '/selfDefenceTechniques'); // Navigate to '/selfDefenceTechniques' route
                                },
                                child: Text(
                                  "Self Defence Techniques",
                                  style: TextStyle(
                                    color:
                                        Colors.black, // Set text color to black
                                    fontSize: screenWidth *
                                        0.05, // Set text font size
                                    fontWeight:
                                        FontWeight.bold, // Set text font weight
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                height: screenWidth *
                                    0.09), // Spacing between buttons

                            SizedBox(
                              width: screenHeight *
                                  0.5, // Set button width to match parent
                              height: screenWidth * 0.13, // Set button height
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors
                                      .white, // Set button background color to white
                                  elevation: 30, // Add 3D effect
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        screenWidth *
                                            0.09), // Set button border radius
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context,
                                      '/helpline'); // Navigate to '/helpline' route
                                },
                                child: Text(
                                  "Help",
                                  style: TextStyle(
                                    color:
                                        Colors.black, // Set text color to black
                                    fontSize: screenWidth *
                                        0.05, // Set text font size
                                    fontWeight:
                                        FontWeight.bold, // Set text font weight
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: screenWidth * 0.2), // Spacing
                            // Additional Elements with Styling
                            Text(
                              "Stay Safe, Stay Strong",
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width *
                                    0.05, // Responsive font size
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                letterSpacing: 1.5,
                              ),
                            ),
                            SizedBox(height: screenWidth * 0.05),
                            Text(
                              "Empowering you with knowledge and skills for self-protection.",
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width *
                                    0.035, // Responsive font size
                                color: Colors.white,
                                letterSpacing: 1.2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: screenWidth * 0.05),

                            // Motivational Quote
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20), // Padding for the quote
                              decoration: const BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        color: Colors.white,
                                        width:
                                            3)), // Add a vertical line to highlight the quote
                              ),
                              child: Text(
                                "\"The best way to predict your future is to create it.\" - Abraham Lincoln",
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.04, // Responsive font size
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                  letterSpacing: 1.2,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.05),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}