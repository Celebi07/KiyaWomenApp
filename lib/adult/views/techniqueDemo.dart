// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:kiya/adult/model/techniqueModel.dart';
import 'package:kiya/adult/constant.dart';
import 'package:video_player/video_player.dart';

class TechniqueDemo extends StatefulWidget {
  static const String id = "TechniqueDemo";

  final Technique technique;

  const TechniqueDemo({required Key key, required this.technique}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TechniqueDemoState createState() => _TechniqueDemoState();
}

class _TechniqueDemoState extends State<TechniqueDemo> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
  // ignore: deprecated_member_use
  _controller = VideoPlayerController.network(
    widget.technique.videoUrl,
  );


    _initializeVideoPlayerFuture = _controller.initialize();

    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(widget.technique.title.toString()),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
                          child: Card(
                margin: const EdgeInsets.all(16),
                elevation: 5.0,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        widget.technique.description,
                        textAlign: TextAlign.justify,
                        style: kTextStyle,
                      ),
                      const SizedBox(height: 50,)
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: const Icon(Icons.play_arrow, size: 32,),
      ),
    );
  }
}