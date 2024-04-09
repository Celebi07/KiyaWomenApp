import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final String nextPath;
  CustomButton({Key? key, required this.name, required this.nextPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonHeight = screenWidth * 0.1;
    return Container(
      height: buttonHeight,
      margin: EdgeInsets.only(bottom: 20),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, nextPath);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return Color(0xFF6C6CEA); // Use gradient for background
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(buttonHeight / 2), // Half of button height for circular borderRadius
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80), // Add padding to the button's text
          child: Text(
            name,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.04, // 4% of screen width
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class CustomButton2 extends StatelessWidget {
  final String name;
  final String nextPath;

  CustomButton2({Key? key, required this.name, required this.nextPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width * 0.25;
    final buttonHeight= MediaQuery.of(context).size.width * 0.1;

    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(30),
      shadowColor: Colors.grey,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, nextPath);
        },
        child: Container(
          width: buttonWidth,
          height: buttonHeight,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFF848383),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            name,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }
}
