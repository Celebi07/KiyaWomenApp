// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';

class EquationCardComparison extends StatefulWidget {
  final Function onCorrectAnswer;

  const EquationCardComparison({
    super.key,
    required this.onCorrectAnswer,
  });

  @override
  State<EquationCardComparison> createState() => _EquationCardComparisonState();
}

class _EquationCardComparisonState extends State<EquationCardComparison> {
  late List<int> equation = generateEquation();
  late int correctAnswer = equationAnswer();
  bool isReadOnly = false;
  int isAnswerCorrect = 0;
  late String currentChosenAnswer = '∧';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
        width: screenWidth * 0.8,
        height: screenHeight * 0.1125,
        margin: EdgeInsets.symmetric(
            vertical: screenHeight * 0.014, horizontal: screenWidth * 0.045),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(screenHeight * 0.01525),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  offset:
                      Offset(screenHeight * 0.00457, screenHeight * 0.00457),
                  blurRadius: screenHeight * 0.014,
                  spreadRadius: screenHeight * 0.0007),
            ]),
        child: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              equation.first.toString(),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: screenHeight * 0.05,
                  fontFamily: 'RubikMonoOne'),
            ),
            SizedBox(
              width: screenWidth * 0.16,
              height: screenHeight * 0.08,
              child: DropdownButton(
                value: currentChosenAnswer != "∧" ? currentChosenAnswer : null,
                items: [">", "<", "="]
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              e,
                              style: TextStyle(
                                  color: isAnswerCorrect == 0
                                      ? Colors.deepPurpleAccent[700]
                                      : isAnswerCorrect == 1
                                          ? const Color.fromRGBO(35, 176, 54, 1)
                                          : const Color.fromRGBO(
                                              236, 91, 95, 1),
                                  fontSize: screenHeight * 0.05,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Nunito-Black'),
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: isReadOnly
                    ? (value) {}
                    : (String? value) =>
                        setState(() => currentChosenAnswer = value!),
                dropdownColor: const Color.fromRGBO(233, 236, 237, 1),
                icon: const Icon(
                  Icons.arrow_downward,
                  color: Colors.yellow,
                ),
                underline: Container(),
              ),
            ),
            Text(
              equation.last.toString(),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: screenHeight * 0.05,
                  fontFamily: 'RubikMonoOne'),
            ),
          ]),
        ));
  }

  List<int> generateEquation() {
    Random random = Random();
    int firstNumber = random.nextInt(101);
    int secondNumber = random.nextInt(101);
    return <int>[firstNumber, secondNumber];
  }

  int equationAnswer() {
    return equation.first < equation.last
        ? -1
        : equation.first > equation.last
            ? 1
            : 0;
  }
}
