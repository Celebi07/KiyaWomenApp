import 'package:flutter/material.dart';

class TeenProfile extends StatefulWidget {
  @override
  _TeenProfileState createState() => _TeenProfileState();
}

class _TeenProfileState extends State<TeenProfile> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  String _name = 'Jane';
  int _age = 18; // Initial age

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromRGBO(108, 108, 234, 1),
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: screenSize.height * 0.0925,
              left: screenSize.width * 0.033,
              child: Container(
                width: screenSize.width * 0.934,
                height: screenSize.height * 0.91,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(screenSize.width * 0.05),
                    topRight: Radius.circular(screenSize.width * 0.05),
                  ),
                  color: Color.fromRGBO(251, 251, 251, 1),
                ),
              ),
            ),
            Positioned(
              top: screenSize.height * 0.066,
              left: screenSize.width * 0.413,
              child: Text(
                'Profile',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Montserrat',
                  fontSize: screenSize.width * 0.048,
                ),
              ),
            ),
            Positioned(
              top: screenSize.height * 0.147,
              left: screenSize.width * 0.167,
              child: Text(
                'Current Profile',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(81, 81, 110, 1),
                  fontFamily: 'Montserrat',
                  fontSize: screenSize.width * 0.056,
                ),
              ),
            ),
            Positioned(
              top: screenSize.height * 0.392,
              left: screenSize.width * 0.41,
              child: Container(
                width: screenSize.width * 0.097,
                height: screenSize.height * 0.06,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: screenSize.height * 0.001,
                      left: screenSize.width * 0.242,
                      child: Container(
                        width: screenSize.width * 0.35,
                        height: screenSize.height * 0.045,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 229, 215, 1),
                          borderRadius:
                              BorderRadius.circular(screenSize.width * 0.05),
                        ),
                      ),
                    ),
                    Positioned(
                      top: screenSize.height * 0.124,
                      left: screenSize.width * 0.215,
                      child: Container(
                        width: screenSize.width * 0.097,
                        height: screenSize.height * 0.035,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(80, 80, 80, 1),
                          borderRadius:
                              BorderRadius.circular(screenSize.width * 0.05),
                        ),
                      ),
                    ),
                    Positioned(
                      top: screenSize.height * 0.124,
                      left: screenSize.width * 0.6,
                      child: Container(
                        width: screenSize.width * 0.097,
                        height: screenSize.height * 0.035,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(80, 80, 80, 1),
                          borderRadius:
                              BorderRadius.circular(screenSize.width * 0.05),
                        ),
                      ),
                    ),
                    Positioned(
                      top: screenSize.height * 0.064,
                      left: screenSize.width * 0.213,
                      child: Container(
                        width: screenSize.width * 0.3,
                        height: screenSize.height * 0.016,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 188, 188, 1),
                          borderRadius:
                              BorderRadius.circular(screenSize.width * 0.05),
                        ),
                      ),
                    ),
                    Positioned(
                      top: screenSize.height * 0.064,
                      left: screenSize.width * 0.601,
                      child: Container(
                        width: screenSize.width * 0.3,
                        height: screenSize.height * 0.016,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 188, 188, 1),
                          borderRadius:
                              BorderRadius.circular(screenSize.width * 0.05),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: screenSize.height * 0.657,
              left: screenSize.width * 0.376,
              child: Text(
                'Teen Profile',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(23, 23, 48, 1),
                  fontFamily: 'Montserrat',
                  fontSize: screenSize.width * 0.034,
                ),
              ),
            ),
            Positioned(
              top: screenSize.height * 0.714,
              left: screenSize.width * 0.423,
              child: TextButton(
                onPressed: () {
                  _showChangeDialog();
                },
                child: Text(
                  'Change',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(108, 108, 234, 1),
                    fontFamily: 'Montserrat',
                    fontSize: screenSize.width * 0.031,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenSize.height * 0.483,
              left: screenSize.width * 0.375,
              child: TextButton(
                onPressed: () {
                  _showChangeDialog();
                },
                child: Text(
                  'Change',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(108, 108, 234, 1),
                    fontFamily: 'Montserrat',
                    fontSize: screenSize.width * 0.031,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenSize.height * 0.434,
              left: screenSize.width * 0.378,
              child: Text(
                '$_name',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(81, 81, 110, 1),
                  fontFamily: 'Montserrat',
                  fontSize: screenSize.width * 0.039,
                ),
              ),
            ),
            Positioned(
              top: screenSize.height * 0.352,
              left: screenSize.width * 0.025,
              child: Text(
                'Your Name is',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Montserrat',
                  fontSize: screenSize.width * 0.039,
                ),
              ),
            ),
            Positioned(
              top: screenSize.height * 0.604,
              left: screenSize.width * 0.025,
              child: Text(
                'Your Current Age is $_age',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Montserrat',
                  fontSize: screenSize.width * 0.039,
                ),
              ),
            ),
            Positioned(
              top: screenSize.height * 0.03,
              left: screenSize.width * 0.05,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(
                      context); // Navigate back to the previous screen
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showChangeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Change Name and Age"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Enter Name'),
                ),
                TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Enter Age'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  _name = _nameController.text;
                  _age = int.tryParse(_ageController.text) ?? _age;
                });
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
