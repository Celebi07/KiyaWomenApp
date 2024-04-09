// ignore_for_file: file_names, unused_local_variable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TeenOpportunity extends StatefulWidget {
  const TeenOpportunity({super.key});

  @override
  State<TeenOpportunity> createState() => _TeenOpportunityState();
}

class _TeenOpportunityState extends State<TeenOpportunity> {
  late String selectedField;
  final List<Map<String, String>> scholarships = [
    {
      'title': 'TalentSprint WE',
      'description':
          'Women Engineers (WE), a 24-month immersive and LIVE online learning experiential program offered by TalentSprint and supported by Google, trains deserving first-year women engineering students.',
      'url': 'https://we.talentsprint.com/',
      'image': 'assets/images/splash/talentsprint.png',
      'field': 'STEM',
    },
    {
      'title': 'DESIS by D.E. Shaw',
      'description':
          'Students enrolled in an undergraduate or postgraduate degree will participate in unique educational experiences in areas ranging from core technical skills to holistic professional development.',
      'url': 'https://www.deshawindia.com/desis-ascend-educare/about.pdf',
      'image': 'assets/images/splash/deshaw.png',
      'field': 'STEM',
    },
    {
      'title': 'Adobe Women in Tech',
      'description':
          'They recognize talented female undergraduate & master\'s students studying computer science and provide them an opportunity to learn, build, and grow.',
      'url':
          'https://www.adobe.com/in/lead/creativecloud/women-in-technology.html',
      'image': 'assets/images/splash/Adobe-logo.png',
      'field': 'STEM',
    },
    {
      'title': 'Business Internships',
      'description':
          'Students enrolled in an undergraduate or postgraduate degree will participate in unique educational experiences in areas ranging from core technical skills to holistic professional development.',
      'url': 'https://careers.google.com/students/business-internships/',
      'image': 'assets/images/splash/google.png',
      'field': 'Business',
    },
    {
      'title': 'We Make Scholars',
      'description':
          'They recognize talented female undergraduate & master\'s students studying computer science and provide them an opportunity to learn, build, and grow.',
      'url': 'https://www.wemakescholars.com/',
      'image': 'assets/images/splash/wemakescholars.png',
      'field': 'Business',
    },
    {
      'title': 'DELL SCHOLARS PROGRAM ',
      'description':
          'Women Engineers (WE), a 24-month immersive and LIVE online learning experiential program offered by TalentSprint and supported by Google, trains deserving first-year women engineering students.',
      'url': 'https://www.dellscholars.org/',
      'image': 'assets/images/splash/dell.png',
      'field': 'Business',
    },
    {
      'title': 'Empowering Women in Law Scholarship',
      'description':
          'Students enrolled in an undergraduate or postgraduate degree will participate in unique educational experiences in areas ranging from core technical skills to holistic professional development.',
      'url':
          'https://studentscholarships.org/scholarship/13274/empowering-women-in-law-scholarship',
      'image': 'assets/images/splash/ss.png',
      'field': 'Law',
    },
    {
      'title': 'LAW SCHOOL SCHOLARSHIPS FOR WOMEN',
      'description':
          'They recognize talented female undergraduate & master\'s students studying computer science and provide them an opportunity to learn, build, and grow.',
      'url':
          'https://www.bu.edu/law/about/offices/financial-aid/scholarships/scholarships-writing-competitions/outside-scholarships/women/',
      'image': 'assets/images/splash/law.jpg',
      'field': 'Law',
    },
    {
      'title': 'Events and opportunities in the field of law',
      'description':
          'Women Engineers (WE), a 24-month immersive and LIVE online learning experiential program offered by TalentSprint and supported by Google, trains deserving first-year women engineering students.',
      'url': 'https://www.lawctopus.com/tag/chennai-law-firm-internship/',
      'image': 'assets/images/splash/lawocc.png',
      'field': 'Law',
    },
  ];

  @override
  void initState() {
    super.initState();
    selectedField = 'STEM';
  }

  List<Map<String, String>> getFilteredOpportunities() {
    return scholarships.where((opportunity) {
      return opportunity['field'] == selectedField;
    }).toList();
  }

  void filterOpportunities(String field) {
    setState(() {
      selectedField = field;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final Size screenSize = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;

    final double itemWidth = screenWidth;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFEEE2DC),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.07),
        child: AppBar(
          backgroundColor: const Color(0xFFEDC7B7),
          elevation: 0,
          title: Text(
            "Opportunities",
            style: GoogleFonts.kanit(
              fontSize: screenHeight * 0.025, // Adjust font size as needed
              color: const Color.fromARGB(
                  255, 0, 0, 0), // Set color to desired value
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
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: screenHeight * 0.3,
              child: CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 0.8,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
                items: scholarships.map((scholarship) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: screenHeight * 0.006),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(screenHeight * 0.01),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 4.0,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(screenHeight * 0.01),
                              child: Image.asset(
                                scholarship['image'] ?? '',
                                height: screenHeight * 0.3,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(screenHeight * 0.01),
                                color: Colors.black.withOpacity(0.1),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(screenHeight * 0.02),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      scholarship['title']?.toUpperCase() ?? '',
                                      style: TextStyle(
                                        fontSize: screenHeight * 0.03,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontFamily: 'roboto',
                                      ),
                                    ),
                                    SizedBox(height: screenHeight * 0.01),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: screenHeight * 0.02,
                              right: screenHeight * 0.02,
                              child: ElevatedButton(
                                onPressed: () =>
                                    launch(scholarship['url'] ?? ''),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0x0000ffff),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(screenWidth*0.04),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth*0.04, 
                                    vertical: screenWidth*0.04, 
                                  ),
                                ),
                                child: Text(
                                  'Learn More',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenHeight * 0.02,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'roboto',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenHeight * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => filterOpportunities('STEM'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedField == 'STEM'
                        ? const Color(0xFFAC3B61)
                        : const Color(0xFFBAB2B5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(screenWidth * 0.1),
                      ),
                    ),
                    padding: EdgeInsets.all(screenWidth * 0.03),
                  ),
                  child: Text(
                    'STEM',
                    style: TextStyle(
                      fontFamily: 'TiltNeon',
                      color: const Color(0xFF123C69),
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => filterOpportunities('Business'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedField == 'Business'
                        ? const Color(0xFFAC3B61)
                        : const Color(0xFFBAB2B5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(screenWidth * 0.1),
                      ),
                    ),
                    padding: EdgeInsets.all(screenWidth * 0.03),
                  ),
                  child: Text(
                    'Business',
                    style: TextStyle(
                      fontFamily: 'TiltNeon',
                      color: const Color(0xFF123C69),
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => filterOpportunities('Law'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedField == 'Law'
                        ? const Color(0xFFAC3B61)
                        : const Color(0xFFBAB2B5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(screenWidth * 0.1),
                      ),
                    ),
                    padding: EdgeInsets.all(screenWidth * 0.03),
                  ),
                  child: Text(
                    'Law',
                    style: TextStyle(
                      fontFamily: 'TiltNeon',
                      color: const Color(0xFF123C69),
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: getFilteredOpportunities().map((opportunity) {
                return OpportunityTile(
                  company: opportunity['title'] ?? '',
                  position: opportunity['description'] ?? '',
                  url: opportunity['url'] ?? '',
                  logo: opportunity['image'] ?? '',
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class OpportunityTile extends StatelessWidget {
  final String company;
  final String position;
  final String url;
  final String logo;

  const OpportunityTile({
    super.key,
    required this.company,
    required this.position,
    required this.url,
    required this.logo,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final Size screenSize = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(screenWidth * 0.07),
      ),
      child: Container(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              logo,
              height: screenWidth * 0.15,
              width: screenWidth * 0.15,
            ),
            SizedBox(width: screenWidth * 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    company,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: screenWidth * 0.03),
                  Text(
                    position,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.03),
                  OutlinedButton(
                    onPressed: () => launch(url),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.03),
                      ),
                      side: BorderSide(
                        color: const Color(0xFFBAB2B5),
                        width: screenWidth * 0.03,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.03,
                        vertical: screenWidth * 0.03,
                      ),
                    ),
                    child: const Text(
                      'Apply Now',
                      style: TextStyle(
                        color: Color(0xFF123C69),
                        backgroundColor: Color(0xFFBAB2B5),
                      ),
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
