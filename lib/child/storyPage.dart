import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiya/child/nonoPage.dart';

class StoryTime extends StatefulWidget {
  const StoryTime({Key? key}) : super(key: key);

  @override
  _StoryTimeState createState() => _StoryTimeState();
}

class _StoryTimeState extends State<StoryTime> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double cardWidth = screenSize.width * 0.9;

    return Scaffold(
      backgroundColor: Color(0xff6C6CEA),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.all(10),
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
                Text(
                  "Story Time",
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(color: Color(0xffFFFFFF), fontSize: 18),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 5),
                          Padding(
                            padding: EdgeInsets.fromLTRB(25, 30, 25, 0),
                            child: Text(
                              "Let's learn about boundaries and understand our bodies.",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(color: Color(0xff171730), fontSize: 15),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 15, 20, 5),
                            child: Card(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => NonoSqare()));
                                },
                                child: Container(
                                  width: cardWidth,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xffC1A4FF)),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width: 10),
                                          Image.asset(
                                            "assets/images/splash/logo.png",
                                            height: 150,
                                            width: 150,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "No-No Square",
                                                style: GoogleFonts.bowlbyOne(
                                                  textStyle: TextStyle(
                                                      color: Color(0xff000000), fontSize: 18),
                                                ),
                                              ),
                                              Text(
                                                "Do you know your body?",
                                                style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                      color: Color(0xff000000), fontSize: 12),
                                                ),
                                                maxLines: 3,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
                            child: Card(
                              child: Container(
                                width: cardWidth,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffC1A4FF)),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Text(
                                            "Personal Bubble",
                                            style: GoogleFonts.bowlbyOne(
                                              textStyle:
                                                  TextStyle(color: Color(0xff000000), fontSize: 27),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
                                          child: Text(
                                            "Learn about what is a personal bubble and play games!",
                                            style: GoogleFonts.montserrat(
                                              textStyle:
                                                  TextStyle(color: Color(0xff000000), fontSize: 15),
                                            ),
                                            maxLines: 3,
                                          ),
                                        ),
                                        Image.asset(
                                          "assets/images/splash/logo.png",
                                          // height: 230,
                                          // width: 230,
                                        ),
                                      ],
                                    ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
