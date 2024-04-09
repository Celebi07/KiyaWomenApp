// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiya/child/ChildStudy/ElevatedGradientButton.dart';
import 'package:kiya/child/ChildStudy/EquationCard.dart';
import 'package:kiya/child/ChildStudy/EquationCardComparison.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

enum MatheCardType { calculation, comparison }

class MathematicsPage extends StatefulWidget {
  const MathematicsPage(
      {super.key, required this.title, required this.cardType});
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final MatheCardType cardType;

  final int requiredEquationsAmount = 15;

  final String title;

  @override
  State<MathematicsPage> createState() => _MathematicsPageState();
}

class _MathematicsPageState extends State<MathematicsPage>
    with SingleTickerProviderStateMixin {
  int solvedEquations = 0;
  late List<AnimatedBuilder> equationCardList = generateEquationCardList();
  late AnimationController _cardAppearController;
  late List<Animation> _positionAnimation;

  @override
  void initState() {
    super.initState();

    _cardAppearController = AnimationController(
      duration: const Duration(milliseconds: 15000),
      vsync: this,
    );

    _positionAnimation = [
      for (int i = 0; i < widget.requiredEquationsAmount; i++)
        Tween<Offset>(begin: const Offset(300, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: _cardAppearController,
                curve: (Interval(
                    (i) * (1 / (widget.requiredEquationsAmount * 3)),
                    (i + 1) * (1 / (widget.requiredEquationsAmount * 3)) +
                        1 / (widget.requiredEquationsAmount * 1.5),
                    curve: Curves.bounceOut))))
    ];
    _cardAppearController.forward();
    _cardAppearController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFEEE2DC),
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
          child: AppBar(
            backgroundColor: const Color(0xFFEDC7B7),
            elevation: 0,
            title: Text(
              "Learn Mathematics",
              style: GoogleFonts.kanit(
                fontSize: MediaQuery.of(context).size.height * 0.025,
                color: const Color.fromARGB(255, 0, 0, 0),
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
        body: Stack(children: [
          SizedBox(
            height: screenHeight * 0.574,
            child: RawScrollbar(
              crossAxisMargin: 2.5,
              thumbColor: const Color(0xFF606060),
              radius: Radius.circular(screenHeight * 0.125),
              thickness: 16,
              thumbVisibility: true,
              interactive: true,
              child: ListView(
                addAutomaticKeepAlives: true,
                physics: const BouncingScrollPhysics(),
                children: equationCardList,
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: screenHeight * 0.318,
                width: screenWidth,
                child: CircularPercentIndicator(
                    radius: screenHeight * 0.125,
                    lineWidth: screenHeight * 0.015625,
                    percent: solvedEquations / widget.requiredEquationsAmount,
                    progressColor: const Color.fromRGBO(253, 216, 53, 1),
                    backgroundColor: Colors.grey.shade100,
                    circularStrokeCap: CircularStrokeCap.round,
                    animation: true,
                    animationDuration: 1000,
                    curve: Curves.bounceOut,
                    center: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Colors.red, Colors.orange],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: ElevatedGradientButton(
                          height: screenHeight * 0.2,
                          width: screenHeight * 0.2,
                          borderRadius: screenHeight * 0.4,
                          onPressed: () {
                            if (solvedEquations ==
                                widget.requiredEquationsAmount) {
                              Navigator.pushReplacementNamed(
                                  context, '/matheChoice');
                            }
                          },
                          child: Icon(
                            Icons.star_rounded,
                            color: Color.lerp(
                                const Color(0xFFAC3B61),
                                const Color(0xFFFDD835),
                                solvedEquations /
                                    widget.requiredEquationsAmount),
                            size: solvedEquations !=
                                    widget.requiredEquationsAmount
                                ? screenHeight * 0.170
                                : screenHeight * 0.180,
                          ),
                        ))),
              )),
        ]));
  }

  @override
  void dispose() {
    _cardAppearController.dispose();
    super.dispose();
  }

  List<AnimatedBuilder> generateEquationCardList() {
    List<AnimatedBuilder> resultedList = [
      for (int i = 0; i < widget.requiredEquationsAmount; i++)
        AnimatedBuilder(
          animation: _cardAppearController,
          builder: (BuildContext context, _) {
            return Transform.translate(
              offset: _positionAnimation[i].value ?? const Offset(300, 0),
              child: widget.cardType == MatheCardType.calculation
                  ? EquationCard(onCorrectAnswer: onCorrectAnswer)
                  : EquationCardComparison(onCorrectAnswer: onCorrectAnswer),
            );
          },
        )
    ];
    return resultedList;
  }

  void onCorrectAnswer() {
    setState(() {
      solvedEquations++;
    });
  }
}
