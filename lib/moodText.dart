import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectionController2 extends GetxController {
  var selectedText = ''.obs;
  var finalval = ''.obs;
  void setSelectedText(String text) {
    selectedText.value = text;
  }

  void setFinalVal(String text) {
    finalval.value = text;
  }
}

class MySmallBlock extends StatelessWidget {
  final String imagePath;
  final String text;
  final Color backgroundColor;
  final Function onTap;

  const MySmallBlock({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.backgroundColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              width: 50,
              height: 50,
            ),
            SizedBox(height: 8),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8)
          ],
        ),
      ),
    );
  }
}
class MyHomeComponent extends StatelessWidget {
  final SelectionController2 controller = Get.put(SelectionController2());

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return SizedBox(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        buildAnimatedOpacity(
                          imagePath: 'assets/images/splash/smile.png',
                          text: 'Happy',
                          backgroundColor: const Color.fromARGB(255, 106, 208, 109),
                          onTap: () => onTapAction(
                              'Great to hear! Keep up the positivity!', 'Happy'),
                        ),
                        buildAnimatedOpacity(
                          imagePath: 'assets/images/splash/Calm.png',
                          text: 'Calm',
                          backgroundColor: const Color.fromARGB(255, 113, 51, 219),
                          onTap: () =>
                              onTapAction('Relax, I\'m here to assist you', 'Calm'),
                        ),
                        buildAnimatedOpacity(
                          imagePath: 'assets/images/splash/angry.png',
                          text: 'Angry',
                          backgroundColor: Colors.pink,
                          onTap: () => onTapAction(
                              'Take deep breaths, count to ten', 'Angry'),
                        ),
                        buildAnimatedOpacity(
                          imagePath: 'assets/images/splash/Relax.png',
                          text: 'Neutral',
                          backgroundColor: const Color.fromARGB(255, 75, 163, 235),
                          onTap: () => onTapAction('Neutral :)', 'Neutral'),
                        ),
                        buildAnimatedOpacity(
                          imagePath: 'assets/images/splash/angry.png',
                          text: 'Sad',
                          backgroundColor: Colors.orange,
                          onTap: () => onTapAction(
                              'Allow yourself to feel, then heal.', 'Sad'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                alignment: Alignment.center,
                child: Obx(() => Text(
                      controller.finalval.isNotEmpty
                          ? controller.finalval.value
                          : '',
                      style: const TextStyle(fontSize: 16),
                    )),
              ),
            ],
          ),
        );
            },
    );
  }

  Widget buildAnimatedOpacity({
    required String imagePath,
    required String text,
    required Color backgroundColor,
    required Function onTap,
  }) {
    return Obx(
      () => AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: controller.selectedText.isNotEmpty
            ? (controller.selectedText.value == text ? 1.0 : 0.5)
            : 1.0,
        child: MySmallBlock(
          imagePath: imagePath,
          text: text,
          backgroundColor: backgroundColor,
          onTap: () {
            onTap();
            // controller.setSelectedText(text);
          },
        ),
      ),
    );
  }

  void onTapAction(String text, String selectedText) {
    controller.setSelectedText(selectedText);
    controller.setFinalVal(text);
  }
}
