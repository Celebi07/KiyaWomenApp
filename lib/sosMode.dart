// ignore_for_file: file_names, library_private_types_in_public_api, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SOSMode extends StatefulWidget {
  const SOSMode({super.key});

  @override
  _SOSModeState createState() => _SOSModeState();
}

class _SOSModeState extends State<SOSMode> {
  bool value = false;
  int val = -1;

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
          title: Text(
            "S.O.S Mode",
            style: GoogleFonts.kanit(
              fontSize: screenHeight * 0.025, // Adjust font size as needed
              color: const Color.fromARGB(
                  255, 0, 0, 0), // Set color to desired value
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.03),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xfffbab2b5), // Change the color to black
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.04),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(height: screenHeight * 0.02),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        screenWidth * 0.06,
                                        0,
                                        screenWidth * 0.06,
                                        0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.add,
                                            size: screenWidth * 0.09,
                                            color: const Color(0xFF123C69)),
                                        Text(
                                          "Add contact",
                                          style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                color: const Color(0xFF123C69),
                                                fontSize: screenWidth * 0.03),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(screenWidth * 0.01,
                                    0, screenWidth * 0.01, 0),
                                child: Text(
                                  "Emergency Contact Name ",
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color: const Color(0xFFAC3B61),
                                        fontSize: screenWidth * 0.04),
                                  ),
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              SizedBox(
                                width: screenWidth * 0.8,
                                height: screenHeight * 0.07,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          screenWidth * 0.09),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          screenWidth * 0.09),
                                      borderSide: const BorderSide(
                                          color: Color(
                                              0xFF606060)), // Border color when focused
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          screenWidth * 0.09),
                                      borderSide: const BorderSide(
                                          color: Color(
                                              0xFF606060)), // Border color when not focused
                                    ),
                                    filled: true,
                                    hintStyle:
                                        TextStyle(color: Colors.grey[800]),
                                    hintText: "Name",
                                    fillColor: Colors.white70,
                                  ),
                                  cursorColor:
                                      const Color(0xFF606060), // Cursor color
                                  textAlignVertical: TextAlignVertical.center,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Padding(
                                padding: EdgeInsets.fromLTRB(screenWidth * 0.01,
                                    0, screenWidth * 0.01, 0),
                                child: Text(
                                  "Primary Phone Number",
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color: const Color(0xFFAC3B61),
                                        fontSize: screenWidth * 0.04),
                                  ),
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              SizedBox(
                                width: screenWidth * 0.8,
                                height: screenHeight * 0.07,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          screenWidth * 0.09),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          screenWidth * 0.09),
                                      borderSide: const BorderSide(
                                          color: Color(
                                              0xFF606060)), // Border color when focused
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          screenWidth * 0.09),
                                      borderSide: const BorderSide(
                                          color: Color(
                                              0xFF606060)), // Border color when not focused
                                    ),
                                    filled: true,
                                    hintStyle:
                                        TextStyle(color: Colors.grey[800]),
                                    hintText: "Phone Number",
                                    fillColor: Colors.white70,
                                  ),
                                  cursorColor:
                                      const Color(0xFF606060), // Cursor color
                                  textAlignVertical: TextAlignVertical.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(
                                screenWidth * 0.06
                              ),
                              child: Text(
                                "Location Sharing",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: const Color(0xFF123C69),
                                    fontSize: screenWidth * 0.03,
                                    fontWeight:
                                        FontWeight.bold, // Making the text bold
                                  ),
                                ),
                              ),
                            ),
                            Radio(
                              value: 1,
                              groupValue: val,
                              onChanged: (value) {
                                setState(() {
                                  val = 1;
                                });
                              },
                              activeColor: Colors
                                  .black, // Setting the active color to black
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.05),
                          child: Card(
                            child: Container(
                              height: screenHeight * 0.15,
                              width: screenWidth * 0.9,
                              decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xFF606060)),
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: screenWidth * 0.02),
                                      Radio(
                                        value: 1,
                                        groupValue: val,
                                        onChanged: (value) {
                                          setState(() {
                                            val = 1;
                                          });
                                        },
                                        activeColor: Colors
                                            .black, // Setting the active color to black
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.5,
                                        child: Text(
                                          "Send your last location to this contact\n whenever your battery is below 5%",
                                          style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                color: const Color(0xFF123C69),
                                                fontSize: screenWidth * 0.03),
                                          ),
                                          maxLines: 9,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              screenWidth * 0.05,
                              screenWidth * 0.05,
                              screenWidth * 0.05,
                              screenWidth * 0.05),
                          child: Card(
                            child: Container(
                              height: screenHeight * 0.20,
                              width: screenWidth * 0.95,
                              color: const Color(0xFF123C69),
                              child: Padding(
                                padding: EdgeInsets.all(screenWidth * 0.02),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Background Mode",
                                          style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: screenWidth * 0.035),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: screenHeight * 0.01),
                                    Text(
                                      "While this mode is on, shouting your “safe word” five times will share your last location to your emergency contact.",
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.03),
                                      ),
                                    ),
                                    SizedBox(height: screenHeight * 0.015),
                                    GestureDetector(
                                      child: Container(
                                        height: screenHeight * 0.055,
                                        width: screenWidth * 0.45,
                                        color: const Color(0xFF3D73AC),
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                              screenWidth * 0.01),
                                          child: Text(
                                            "Edit Safe Word",
                                            style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: screenWidth * 0.03),
                                            ),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(
                                                        screenWidth * 0.05)),
                                              ),
                                              backgroundColor:
                                                  const Color(0xFF123C69),
                                              content: SizedBox(
                                                height: screenHeight * 0.25,
                                                width: screenWidth * 0.6,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                        height: screenHeight *
                                                            0.03),
                                                    Text(
                                                      "Edit Safe Word",
                                                      style: GoogleFonts.roboto(
                                                        textStyle: TextStyle(
                                                            color: Colors.white,
                                                            fontSize:
                                                                screenWidth *
                                                                    0.04),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: screenHeight *
                                                            0.02),
                                                    SizedBox(
                                                      width: screenWidth * 0.6,
                                                      height:
                                                          screenHeight * 0.07,
                                                      child: TextField(
                                                        style: const TextStyle(
                                                            color: Colors
                                                                .black), // Set text color
                                                        cursorColor: const Color(
                                                            0xFF606060), // Set cursor color
                                                        decoration:
                                                            InputDecoration(
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide: const BorderSide(
                                                                color: Color(
                                                                    0xFF606060)), // Set border color
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    screenWidth *
                                                                        0.03), // Adjust border radius
                                                          ),
                                                          filled: true,
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide: const BorderSide(
                                                                color: Color(
                                                                    0xFF606060)), // Set focused border color
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    screenWidth *
                                                                        0.03), // Adjust border radius
                                                          ),

                                                          hintText: "Safe word",
                                                          hintStyle: const TextStyle(
                                                              color: Color(
                                                                  0xFF606060)), // Set hint text color
                                                          fillColor:
                                                              Colors.white70,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: screenHeight *
                                                            0.02),
                                                    SizedBox(
                                                        width:
                                                            screenWidth * 0.6,
                                                        height: screenHeight *
                                                            0.075,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  screenWidth *
                                                                      0.01),
                                                          child: ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              elevation: 30,
                                                              backgroundColor:
                                                                  const Color(
                                                                      0xFF606060),
                                                            ),
                                                            onPressed: () {
                                                              var snackBar =
                                                                  const SnackBar(
                                                                content: Text(
                                                                    'Saved "Help Help Help" as your safe word'),
                                                              );
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      snackBar);
                                                            },
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                      screenWidth *
                                                                          0.02),
                                                              child: Text(
                                                                'Save',
                                                                style: GoogleFonts
                                                                    .tiltNeon(
                                                                  textStyle:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        screenWidth *
                                                                            0.07,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Container(
                          width: screenWidth / 2.7,
                          height: screenHeight * 0.065,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(screenWidth * 0.1),
                            ),
                            color: const Color(0xFFFFFFFF),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(screenWidth * 0.01),
                            child: GestureDetector(
                              child: Center(
                                child: Text(
                                  'Activate',
                                  style: GoogleFonts.eczar(
                                    textStyle: TextStyle(
                                      color: const Color(0xFF123C69),
                                      fontSize: screenWidth * 0.08,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black
                                              .withOpacity(0.9), // Shadow color
                                          blurRadius: 2, // Blur radius
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                var snackBar = const SnackBar(
                                  content: Text('Activated S.O.S mode'),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight*0.04), 
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
