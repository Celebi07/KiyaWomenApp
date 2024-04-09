import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:kiya/adult/constant.dart';

class HomeButton extends StatelessWidget {
  const HomeButton(
      {required Key key,
      required this.route,
      required this.title,
      required this.widget})
      : super(key: key);

  final String route;
  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      openElevation: 0.0,
      closedElevation: 0.0,
      closedColor: Colors.transparent,
      openBuilder: (context, action) {
        return widget;
      },
      closedBuilder: (context, action) {
        action() {
          Navigator.pushNamed(context, route);
        }

        return GestureDetector(
          onTap: () => action(),
          child: Container(
            decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            child: Text(
              title,              
              style: kBoldText.copyWith(
                  color: Colors.black, fontWeight: FontWeight.values[2], letterSpacing: 0.8),
            ),
          ),
        );
      },
    );
  }
}