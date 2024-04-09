// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChatScreenStateful();
  }
}

class ChatScreenStateful extends StatefulWidget {
  const ChatScreenStateful({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreenStateful> {
  final TextEditingController _textEditingController = TextEditingController();
  List<Message> messages = [
    Message(text: "Hello!", isMe: false),
    Message(text: "Hi there!", isMe: true),
    Message(text: "How are you?", isMe: false),
    Message(text: "I'm good, thanks!", isMe: true),
  ];

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFEEE2DC),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.07),
        child: AppBar(
          backgroundColor: const Color(0xFFEDC7B7),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
          color: Color(0xFFEEE2DC),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return MessageBubble(
                    message: message,
                    isMe: message.isMe,
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenSize.width * 0.05,
                  vertical: screenSize.height * 0.02),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      cursorColor: const Color(0xFF848383),
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        filled: true,
                        fillColor: Colors.transparent,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(screenSize.width * 0.09),
                          borderSide: const BorderSide(
                              color: Color(0xFF848383), width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(screenSize.width * 0.09),
                          borderSide: const BorderSide(
                              color: Color(0xFF848383), width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(screenSize.width * 0.09),
                          borderSide: const BorderSide(
                              color: Color(0xFF848383), width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: screenSize.width * 0.02),
                  Container(
                    width:
                        screenSize.width * 0.12, // Adjust the width as needed
                    height: screenSize.width *
                        0.12, // Ensure it's the same as width to create a circle
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF848383), // Circular container color
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.send_rounded),
                      color: Colors.black, // Adjust the icon color if needed
                      onPressed: () {
                        String messageText = _textEditingController.text;
                        if (messageText.isNotEmpty) {
                          setState(() {
                            messages
                                .add(Message(text: messageText, isMe: true));
                            _textEditingController.clear();
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Message {
  final String text;
  final bool isMe;

  Message({required this.text, required this.isMe});
}

class MessageBubble extends StatelessWidget {
  final Message message;
  final bool isMe;

  const MessageBubble({super.key, 
    required this.message,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: screenSize.height * 0.01,
          horizontal: screenSize.width * 0.05),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(screenSize.width * 0.03),
            decoration: BoxDecoration(
              color: isMe ? const Color(0xFF848383) : const Color(0xFFBAB2B5),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(screenSize.width * 0.07),
                topRight: Radius.circular(screenSize.width * 0.07),
                bottomLeft: isMe
                    ? Radius.circular(screenSize.width * 0.07)
                    : const Radius.circular(0),
                bottomRight: isMe
                    ? const Radius.circular(0)
                    : Radius.circular(screenSize.width * 0.07),
              ),
            ),
            child: Text(
              message.text,
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                color: isMe ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
