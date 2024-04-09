import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class EquationCard extends StatefulWidget {
  final Function onCorrectAnswer;

  const EquationCard({
    Key? key,
    required this.onCorrectAnswer,
  }) : super(key: key);

  @override
  State<EquationCard> createState() => _EquationCardState();
}

class _EquationCardState extends State<EquationCard> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin{
  final _textController = TextEditingController();
  late String equation = generateEquation();
  late int correctAnswer = equationAnswer();
  bool isReadOnly = false;
  int isAnswerCorrect = 0;
  late AnimationController _cardDisappearController;
  late Animation _positionAnimation;
  Color markerColour = const Color.fromRGBO(233, 236, 237, 1);
  Color fieldColour = const Color.fromRGBO(233, 236, 237, 1);

  @override
  void initState() {
    super.initState();

    _cardDisappearController = AnimationController(
      duration: const Duration(milliseconds: 6000),
      vsync: this,
    );

    _positionAnimation = Tween<Offset>(
          begin: const Offset(0, 0),
          end: const Offset(450, 0))
          .animate(CurvedAnimation(
          parent: _cardDisappearController,
          curve: (const Interval(2/3, 1, curve: Curves.elasticInOut))));
    _cardDisappearController.addListener(() {setState(() {});});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Transform.translate(
      offset: _positionAnimation.value ?? const Offset(0, 0),
      child: Container(
          width: screenWidth * 0.08,
          height: screenHeight * 0.1125,
          margin: EdgeInsets.symmetric(vertical: screenHeight * 0.014, horizontal: screenWidth * 0.045),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(screenHeight * 0.01525),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(screenHeight * 0.00457, screenHeight * 0.00457),
                    blurRadius: screenHeight * 0.014,
                    spreadRadius: screenHeight * 0.0007
                ),
              ]
          ),
          child: Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text(
                    equation,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: screenHeight * 0.05,
                        fontFamily: 'RubikMonoOne'
                    ),
                  ),
                  AnimatedContainer(
                      //margin: EdgeInsets.symmetric(vertical: screenHeight * 0.14, horizontal: screenWidth * 0.01) ,
                      width: screenWidth * 0.24,
                      height: screenHeight * 0.08,
                      decoration: BoxDecoration(
                        color: fieldColour,
                        borderRadius: BorderRadius.circular(screenHeight * 0.014),
                      ),
                      duration: const Duration(milliseconds: 125),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(2)
                        ],
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.top,
                        readOnly: isReadOnly,
                        onEditingComplete: () {
                          setState(() {
                            isReadOnly = true;
                            if(correctAnswer == int.parse(_textController.text)) {
                              setState(() {
                                isAnswerCorrect = 1;
                              });
                              widget.onCorrectAnswer();
                              _cardDisappearController.forward();
                              setState(() {
                                markerColour = const Color.fromRGBO(35, 176, 54, 1);
                                fieldColour = const Color.fromRGBO(220, 254, 224, 1);
                              });
                              Timer(const Duration(seconds: 2), () {
                                super.deactivate();
                              });
                            }
                            else {
                              isAnswerCorrect = -1;
                              setState(() {
                                markerColour = const Color.fromRGBO(236, 91, 95, 1);
                                fieldColour = const Color.fromRGBO(255, 235, 235, 1);
                              });
                              Timer(const Duration(seconds: 2), () {
                                setState(() { isReadOnly = false; });
                              });
                            }
                          });
                        },
                        style: TextStyle(
                            color: isAnswerCorrect == 0 ? Colors.deepPurpleAccent[700] : isAnswerCorrect == 1 ? const Color.fromRGBO(35, 176, 54, 1): const Color.fromRGBO(236, 91, 95, 1),
                            fontSize: screenHeight * 0.065,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Nunito-Black'
                        ),
                        controller: _textController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                  ),
                  AnimatedContainer(
                      margin: const EdgeInsets.only(left: 10) ,
                      width: screenWidth * 0.03,
                      height: screenHeight * 0.07,
                      decoration: BoxDecoration(
                        color: markerColour,
                        borderRadius: BorderRadius.circular(screenHeight * 0.014),
                      ), duration: const Duration(milliseconds: 125),
                  )
                ]
            ),
          )
      ),
    );
  }
  String generateEquation() {
    Random random = Random();
    int firstNumber = random.nextInt(21);
    bool equationMark = random.nextBool();
    int secondNumber = equationMark ? random.nextInt(21 - firstNumber) : random.nextInt(firstNumber + 1);
    String randomEquation = equationMark ? firstNumber.toString() + "+" + secondNumber.toString() : firstNumber.toString() + "-" + secondNumber.toString();
    int equationAnswer = equationMark ? firstNumber + secondNumber : firstNumber - secondNumber;
    setState(() {
      correctAnswer = equationAnswer;
    });
    return(randomEquation + "=");
  }

  int equationAnswer() {
    equation.substring(-2);
    return 0;
  }

  @override
  void dispose() {
    _cardDisappearController.dispose();
    super.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}