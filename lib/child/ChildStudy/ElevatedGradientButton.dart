// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ElevatedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;
  final double borderRadius;

  const ElevatedGradientButton({
    super.key,
    this.child = const Text(""),
    this.gradient = const RadialGradient(
      colors: [Color(0xFFAC3B61), Color(0xFF123C69)],
      // begin: Alignment.bottomCenter,
      // end: Alignment.topCenter
    ),
    this.width = 50.0,
    this.height = 50.0,
    this.borderRadius = 10,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.5),
              blurRadius: 1.5,
            ),
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: () {
              onPressed();
            },
            child: Center(
              child: child,
            )),
      ),
    );
  }
}
