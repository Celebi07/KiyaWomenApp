// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:kiya/chatPage.dart';
import 'package:kiya/teen/teenOpportunity.dart';

class TeenNavBar extends StatefulWidget {
  final String name;
  const TeenNavBar({super.key, required this.name});

  @override
  State<TeenNavBar> createState() => _TeenNavBarState();
}

class _TeenNavBarState extends State<TeenNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffEEE6F3),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildTeenScreen(screenSize),
          const ChatWidget(),
          const TeenOpportunity(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFEDC7B7),
        selectedItemColor: const Color(0xFF123C69),
        unselectedItemColor: const Color(0xFF848383),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        iconSize: screenHeight * 0.032,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined),
            label: 'Explore',
          ),
        ],
      ),
    );
  }


    Widget _buildTeenScreen(Size screenSize) {
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
      body: SizedBox(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
                top: screenWidth * 0.03,
                bottom: screenWidth * 0.03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Lottie Widget Here
                      Lottie.asset(
                        'assets/images/splash/9.json', // Provide your Lottie animation file path
                        width: screenWidth * 0.16, // Adjust the width as needed
                        height:
                            screenWidth * 0.16, // Adjust the height as needed
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                          width: screenWidth *
                              0.02), // Adjust the spacing as needed
                      Text(
                        "Welcome ${widget.name}",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            color: const Color(0xFF123C69),
                            fontSize: screenWidth * 0.06,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Center(
                    child: Text(
                      "Unleash Your Inner Warrior: Master Self-Defense Moves & Become Unstoppable.",
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: const Color(0xFFAC3B61),
                          fontSize: screenWidth * 0.048,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenWidth * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Feeling like it's time to take charge?",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: const Color(0xFF123C69),
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ),
                SizedBox(
                    width: screenHeight *
                        0.035), // Add spacing between the elements
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(screenWidth *
                            0.01), // Add padding to increase touch area
                        decoration: BoxDecoration(
                          color: const Color(0xFFBAB2B5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(
                              10), // Adjust radius as needed
                        ),
                        child: Image.asset(
                          'assets/images/splash/shield.png',
                          height: MediaQuery.of(context).size.height *
                              0.07, // Adjust height as needed
                          fit: BoxFit.contain, // Adjust fit as needed
                        ),
                      ),
                      const SizedBox(height: 5), // Add spacing between image and text
                      Text(
                        'Learn',
                        style: GoogleFonts.tiltNeon(
                          textStyle: TextStyle(
                            color: const Color(0xFFAC3B61),
                            fontSize: screenWidth * 0.043,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: screenWidth * 0.05),

            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
                top: screenWidth * 0.03,
                bottom: screenWidth * 0.03,
              ),
              child: Text(
                "Encountering a threat? Activate your SOS lifeline.",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: const Color(0xFFAC3B61),
                    fontSize: screenWidth * 0.048,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenWidth * 0.05),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/sosMode');
              },
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(screenWidth *
                        0.01), // Add padding to increase touch area
                    decoration: BoxDecoration(
                      color: const Color(0xFFBAB2B5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius:
                          BorderRadius.circular(10), // Adjust radius as needed
                    ),
                    child: Image.asset(
                      'assets/images/splash/sos.png',
                      height: MediaQuery.of(context).size.height *
                          0.07, // Adjust height as needed
                      fit: BoxFit.contain, // Adjust fit as needed
                    ),
                  ),
                  const SizedBox(height: 5), // Add spacing between image and text
                  Text(
                    'S.O.S',
                    style: GoogleFonts.tiltNeon(
                      textStyle: TextStyle(
                        color: const Color(0xFFAC3B61),
                        fontSize: screenWidth * 0.043,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}