// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:kiya/adult/model/techniqueModel.dart';
import 'package:kiya/adult/views/techniqueDemo.dart';

class TechniqueWidget extends StatelessWidget {
  const TechniqueWidget({
    required Key key,
    required List<Technique> techniques,
    required this.index,
  })  : _techniques = techniques,
        super(key: key);

  final List<Technique> _techniques;
  final int index;

  @override
  Widget build(BuildContext context) {
    final double imageHeight = MediaQuery.of(context).size.height / 10.5;
    final double imageWidth = MediaQuery.of(context).size.width / 3.5;

    return OpenContainer(
      openElevation: 0.0,
      closedElevation: 0.0,
      closedColor: const Color(0xFFEEE2DC),
      openBuilder: (context, action) {
        return TechniqueDemo(
          technique: _techniques[index],
          key: UniqueKey(),
        );
      },
      closedBuilder: (context, action) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            elevation: 1.5,
            borderOnForeground: true,
            child: InkWell(
              onTap: () => action(),
              child: Row(
                children: [
                  Padding(
                    padding :EdgeInsets.only(
      right: MediaQuery.of(context).size.width * 0.04,
      top: MediaQuery.of(context).size.height * 0.01,
      left: MediaQuery.of(context).size.width * 0.04,
      bottom: MediaQuery.of(context).size.height * 0.01,
    ),
                    child: Image.asset(
                      _techniques[index].imgUrl,
                      fit: BoxFit.cover,
                      height: imageHeight,
                      width: imageWidth,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      _techniques[index].title,
                      style: TextStyle(
                        color: const Color(0xFF123C69),
                        fontWeight: FontWeight.bold,
                        fontSize:  MediaQuery.of(context).size.width * 0.035,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
