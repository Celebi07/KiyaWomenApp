import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NonoSqare extends StatefulWidget {
  const NonoSqare({Key? key}) : super(key: key);

  @override
  _NonoSqareState createState() => _NonoSqareState();
}

class _NonoSqareState extends State<NonoSqare> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xff6C6CEA),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: screenSize.height,
                    width: screenSize.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(0),
                      ),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 30, 25, 0),
                            child: Text(
                              "Let's learn about boundaries and understand our bodies.",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(color: Color(0xff171730), fontSize: 15),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 15, 20, 0),
                            child: Text(
                              "What are private body parts?",
                              style: GoogleFonts.bowlbyOne(
                                textStyle: TextStyle(color: Color(0xff000000), fontSize: 20),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              "assets/images/splash/logo.png",
                              height: screenSize.height * 0.5, // Adjust the height dynamically
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
