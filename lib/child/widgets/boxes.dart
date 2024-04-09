// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Boxes extends StatelessWidget {

  Boxes({super.key, required this.color, });
    var color;
    

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color
      ),
     
    );
  }
}