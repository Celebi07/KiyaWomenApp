import 'package:flutter/material.dart';
import 'package:kiya/adult/adultNavBar.dart';
import 'package:kiya/adult/model/techniqueModel.dart';
import 'package:kiya/adult/views/helpline.dart';
import 'package:kiya/adult/views/homePage.dart';
import 'package:kiya/adult/views/selfDefenceTechniques.dart';
import 'package:kiya/adult/views/selfDefenceTips.dart';
import 'package:kiya/adult/views/techniqueDemo.dart';
import 'package:kiya/chatbot_page/page/chatbot.dart';
import 'package:kiya/checkAgePage.dart';
import 'package:kiya/child/ChildStudy/MatheChoicePage.dart';
import 'package:kiya/child/ChildStudy/MathematicsPage.dart';
import 'package:kiya/child/ChildStudy/mainHomePage.dart';
import 'package:kiya/child/childNavBar.dart';
import 'package:kiya/teen/teenNavBar.dart';
import 'package:kiya/child/storyPage.dart';
import 'package:kiya/child/nonoPage.dart';
import 'package:kiya/chatPage.dart';
import 'package:kiya/sosMode.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MaterialApp(
    initialRoute: '/',
    onGenerateRoute: (settings) {
      switch (settings.name) {
        case '/':
          return MaterialPageRoute(builder: (context) => MyApp());
        case '/ageChecker':
          return MaterialPageRoute(builder: (context) => const CheckAgePage());
        case '/techniqueDemo':
          final technique = Technique(
            title: 'Dummy Technique',
            videoUrl: 'https://example.com/video.mp4',
            description: 'This is a dummy technique description.',
            imgUrl: 'assets/images/splash/Adobe-logo.png',
          );
          return MaterialPageRoute(
              builder: (context) =>
                  TechniqueDemo(technique: technique, key: UniqueKey()));
        case '/helpline':
          return MaterialPageRoute(builder: (context) => const HelpLine());
        case '/childstudy':
          return MaterialPageRoute(
              //matheChoice
              builder: (context) => const MainHomePage());

        case '/matheChoice':
          // (context) => const MathChoicePage();
          return MaterialPageRoute(
              builder: (context) => const MathChoicePage());
        case '/mathe':
          return MaterialPageRoute(
              builder: (context) => const MathematicsPage(
                  title: "Math here!", cardType: MatheCardType.calculation));
        case '/matheComparison':
          return MaterialPageRoute(
              builder: (context) => const MathematicsPage(
                  title: "Math here!", cardType: MatheCardType.comparison));
        case '/chatbot':
          return MaterialPageRoute(builder: (context) => const ChatbotPage());
        case '/selfDefenceTips':
          return MaterialPageRoute(
              builder: (context) => const SelfDefenceTips());
        case '/selfDefenceTechniques':
          return MaterialPageRoute(
              builder: (context) => const SelfDefenceTechniques());
        case '/home':
          return MaterialPageRoute(builder: (context) => const HomePage());
        case '/adultNavBar':
          return MaterialPageRoute(
              builder: (context) => const AdultNavBar(name: 'kashish'));
        case '/childNavBar':
          return MaterialPageRoute(
              builder: (context) => const ChildNavBar(
                    name: 'Kashish',
                  ));
        case '/teenNavBar':
          return MaterialPageRoute(
              builder: (context) => const TeenNavBar(name: 'kashish'));
        case '/sosMode':
          return MaterialPageRoute(builder: (context) => const SOSMode());
        case '/story':
          return MaterialPageRoute(builder: (context) => const StoryTime());
        case '/chat':
          return MaterialPageRoute(builder: (context) => const ChatWidget());
        case '/nono':
          return MaterialPageRoute(builder: (context) => const NonoSqare());
      }
      return null;
    },
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final introKey = GlobalKey<IntroductionScreenState>();

  MyApp({super.key});

  void _onIntroEnd(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/ageChecker');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    const bodyStyle = TextStyle(fontSize: 29.0);

    final pageDecoration = PageDecoration(
      bodyTextStyle: GoogleFonts.getFont(
        'Kalam',
        textStyle: bodyStyle.copyWith(
          fontWeight: FontWeight.bold,
          color: const Color(0xFF123C69),
        ),
      ),
      pageColor: const Color(0xFFEEE2DC), //Color(#xFFEDC7B7),
      imagePadding: EdgeInsets.zero,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFEEE2DC),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            screenWidth * 0.1,
            screenWidth * 0.5,
            screenWidth * 0.1,
            screenWidth * 0.2,
          ),
          child: Column(
            children: [
              Expanded(
                child: IntroductionScreen(
                  key: introKey,
                  globalBackgroundColor: const Color(0xFFEEE2DC),
                  pages: [
                    PageViewModel(
                      title: "",
                      body: "Unlock Your Potential: Learn, Grow, Conquer.",
                      // Use Lottie widget instead of Image.asset
                      image: Lottie.asset(
                        'assets/images/splash/2.json',
                        width: screenWidth * 15.5,
                        height: screenWidth * 15.5,
                      ),
                      decoration: pageDecoration,
                    ),
                    PageViewModel(
                      title: "",
                      body: "Radiate Strength: Confidence is Your Superpower.",
                      image: Lottie.asset(
                        'assets/images/splash/4.json',
                        width: screenWidth * 10.5,
                        height: screenWidth * 10.5,
                      ),
                      decoration: pageDecoration,
                    ),
                    PageViewModel(
                      title: "",
                      body: "United We Thrive: Empowerment Through Connection.",
                      image: Lottie.asset(
                        'assets/images/splash/1.json',
                        width: screenWidth * 10.5,
                        height: screenWidth * 10.5,
                      ),
                      decoration: pageDecoration,
                    ),
                    PageViewModel(
                      title: "",
                      body:
                          "Stories of Strength: Real Women, Real Empowerment.",
                      image: Lottie.asset(
                        'assets/images/splash/14.json',
                        width: screenWidth * 10.5,
                        height: screenWidth * 10.5,
                      ),
                      decoration: pageDecoration,
                    ),
                  ],
                  onDone: () => _onIntroEnd(context),
                  showSkipButton: false,
                  next: Icon(
                    Icons.arrow_forward,
                    color: const Color(0xFF123C69),
                    size: screenWidth * 0.1,
                    semanticLabel:
                        'Next', // Provide a semantic label for accessibility
                  ),
                  done: const Text(
                    '',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  curve: Curves.fastLinearToSlowEaseIn,
                  controlsMargin: EdgeInsets.all(screenWidth * 0.000005),
                  controlsPadding: EdgeInsets.all(screenWidth * 0.000005),
                  dotsDecorator: DotsDecorator(
                    spacing:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                    size: Size(screenWidth * 0.034, screenWidth * 0.035),
                    color: const Color(0xFF123C69),
                    activeSize: Size(screenWidth * 0.08, screenWidth * 0.035),
                    activeColor: const Color(0xFFAC3B61),
                    activeShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                  ),
                  dotsContainerDecorator: null,
                ),
              ),
              GestureDetector(
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    decoration:
                        TextDecoration.underline, // Add underline decoration
                    fontFamily: 'Roboto',
                    color: const Color(0xFF123C69), // Light colored text
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckAgePage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
