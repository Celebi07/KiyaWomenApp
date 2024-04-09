// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:kiya/adult/adultNavBar.dart';
// import 'package:kiya/moodText.dart';
import 'package:kiya/teen/teenNavBar.dart';
import 'package:kiya/child/childNavBar.dart';

class CheckAgePage extends StatefulWidget {
  const CheckAgePage({super.key});

  @override
  State<CheckAgePage> createState() => _CheckAgePageState();
}

class _CheckAgePageState extends State<CheckAgePage> {
  int age = 0;
  String selectedMood = '';
  final TextEditingController _nameController = TextEditingController();
  Map<String, String> moodText = {
    '😊': 'Every smile brightens the day, find joy in the little things!',
    '😢': 'Turn tears into strength; your resilience defines you.',
    '😡': 'Harness anger into action; fuel your passion for change!',
    '😴': 'Rest is the key to rejuvenation; recharge for a brighter tomorrow.',
    '😄': 'Let laughter be your guide; embrace the beauty of every moment!',
    '😎': 'Confidence is your superpower; own your journey!',
    '😇': 'Kindness is contagious; spread love and light wherever you go!',
  };

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
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.025),
              // Text field for mood input
              Text(
                "What's your vibe today?",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: const Color(0xFF123C69),
                    fontSize: screenWidth * 0.06,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              // Row for displaying mood buttons
              // Display mood buttons in a grid
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: moodText.keys.map((mood) {
                  // Get the size of the emoji
                  double emojiSize =
                      screenWidth * 0.119; // Adjust the multiplier as needed

                  return SizedBox(
                    width: emojiSize,
                    height: emojiSize,
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          selectedMood = mood;
                        });
                      },
                      shape: const CircleBorder(), // Circular button
                      elevation: 0, // No shadow
                      padding: EdgeInsets.zero, // No padding inside the button
                      child: Text(
                        mood,
                        style: TextStyle(
                            fontSize: emojiSize *
                                0.75), // Adjust the font size as needed
                      ),
                    ),
                  );
                }).toList(),
              ),

              SizedBox(height: screenHeight * 0.015),
// Display text related to selected mood
              selectedMood.isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth *
                              0.1), // Adjust the horizontal padding as needed
                      child: Text(
                        moodText[selectedMood] ?? '',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: const Color(0xFFAC3B61),
                            fontSize: screenWidth * 0.04,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
              // const Text(
              //   'How are you feeling today?',
              //   style:
              //       const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              // ),
              // Container(alignment: Alignment.center, child: MyHomeComponent()),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "Dish on yourself!",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: const Color(0xFF123C69),
                    fontSize: screenWidth * 0.06,
                  ),
                ),
              ),
              SizedBox(height: screenWidth * 0.04),
              // Text widget for instruction
              Text(
                "Let's dub you!",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: const Color(0xFFAC3B61),
                    fontSize: screenWidth * 0.05,
                  ),
                ),
              ),

// Padding around the text field
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.1), // Adjust padding as needed
                child: SizedBox(
                  width: screenWidth * 0.25,
                  height: screenHeight * 0.055,
                  child: TextField(
                    controller: _nameController,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Color(0xFF123C69)),
                    decoration: const InputDecoration(
                      filled: false,
                      hintStyle: TextStyle(color: Color(0xFFBAB2B5)),
                      hintText: "Alias alert!",
                    ),
                    cursorColor: const Color(0xFFBAB2B5), // Set cursor color
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.027),
              Text(
                "Adult, teen, or kiddo?",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: const Color(0xFFAC3B61),
                    fontSize: screenWidth * 0.05,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            SizedBox(height: screenHeight * 0.01),
                            Lottie.asset(
                              'assets/images/splash/8.json',
                              width: screenWidth * 0.26,
                              height: screenWidth * 0.26,
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            SizedBox(
                              width: screenWidth / 4.35,
                              height: screenHeight * 0.05,
                              child: Material(
                                elevation: 8, // Change the elevation as needed
                                shadowColor: Colors
                                    .grey, // Change the shadow color as needed
                                borderRadius: BorderRadius.all(
                                  Radius.circular(screenWidth * 0.1),
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      age = 20;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: age == 20
                                        ? const Color(0xFFAC3B61)
                                        : const Color(
                                            0xFF848383), // Set the background color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(screenWidth * 0.1),
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Adult',
                                      style: GoogleFonts.tiltNeon(
                                        textStyle: TextStyle(
                                          color: const Color(0xFF123C69),
                                          fontSize: screenWidth * 0.04,
                                          shadows: [
                                            Shadow(
                                              color: Colors.black.withOpacity(
                                                  0.4), // Shadow color
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
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: screenHeight * 0.01),
                            Lottie.asset(
                              'assets/images/splash/7.json',
                              width: screenWidth * 0.26,
                              height: screenWidth * 0.26,
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            SizedBox(
                              width: screenWidth / 4.35,
                              height: screenHeight * 0.05,
                              child: Material(
                                elevation: 8, // Change the elevation as needed
                                shadowColor: Colors
                                    .grey, // Change the shadow color as needed
                                borderRadius: BorderRadius.all(
                                  Radius.circular(screenWidth * 0.1),
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      age = 15;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: age == 15
                                        ? const Color(0xFFAC3B61)
                                        : const Color(
                                            0xFF848383), // Set the background color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(screenWidth * 0.1),
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Teen',
                                      style: GoogleFonts.tiltNeon(
                                        textStyle: TextStyle(
                                          color: const Color(0xFF123C69),
                                          fontSize: screenWidth * 0.04,
                                          shadows: [
                                            Shadow(
                                              color: Colors.black.withOpacity(
                                                  0.4), // Shadow color
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
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: screenHeight * 0.01),
                            Lottie.asset(
                              'assets/images/splash/5.json',
                              width: screenWidth * 0.26,
                              height: screenWidth * 0.26,
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            SizedBox(
                              width: screenWidth / 4.35,
                              height: screenHeight * 0.05,
                              child: Material(
                                elevation: 8, // Change the elevation as needed
                                shadowColor: Colors
                                    .grey, // Change the shadow color as needed
                                borderRadius: BorderRadius.all(
                                  Radius.circular(screenWidth * 0.1),
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      age = 5;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: age == 5
                                        ? const Color(0xFFAC3B61)
                                        : const Color(
                                            0xFF848383), // Set the background color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(screenWidth * 0.1),
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Child',
                                      style: GoogleFonts.tiltNeon(
                                        textStyle: TextStyle(
                                          color: const Color(0xFF123C69),
                                          fontSize: screenWidth * 0.04,
                                          shadows: [
                                            Shadow(
                                              color: Colors.black.withOpacity(
                                                  0.4), // Shadow color
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
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                "App adventures tailored just for you. Whatcha waitin' for?",
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: const Color(0xFFAC3B61),
                    fontSize: screenWidth * 0.05,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              SizedBox(
                width: screenWidth / 2.7,
                height: screenHeight * 0.065,
                child: Material(
                  elevation: 8, // Change the elevation as needed
                  shadowColor: Colors.grey, // Change the shadow color as needed
                  borderRadius: BorderRadius.all(
                    Radius.circular(screenWidth * 0.1),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      String enteredName = _nameController.text;
                      switch (age) {
                        case 5:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ChildNavBar(name: enteredName),
                            ),
                          );
                          break;
                        case 15:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  TeenNavBar(name: enteredName),
                            ),
                          );
                          break;
                        case 20:
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AdultNavBar(name: enteredName),
                            ),
                          );
                          break;
                        default:
                          break;
                      }
                      setState(() {
                        age = 0;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF848383), // Set the background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(screenWidth * 0.1),
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Submit',
                        style: GoogleFonts.eczar(
                          textStyle: TextStyle(
                            color: const Color(0xFF123C69),
                            fontSize: screenWidth * 0.06,
                            shadows: [
                              Shadow(
                                color: Colors.black
                                    .withOpacity(0.4), // Shadow color
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
// 'assets/images/splash/ss.png',
              SizedBox(height: screenHeight * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth * 0.06),
                      child: Text(
                        'Vent, celebrate, or just chat. The AI is here.',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: screenWidth *
                                0.042, // Adjust font size as needed
                            color: const Color(
                                0xFF123C69), // Adjust text color as needed
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: screenWidth * 0.3, // Adjust width as needed
                      height: screenHeight * 0.12, // Adjust height as needed
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.asset(
                              'assets/images/splash/robot.png', // Provide the path to your image asset
                              fit: BoxFit.cover, // Adjust the fit as needed
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.transparent,
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/chatbot');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
