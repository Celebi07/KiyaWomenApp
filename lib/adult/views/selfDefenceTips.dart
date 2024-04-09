// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiya/adult/constant.dart';
import 'package:kiya/adult/model/tipModel.dart';
import '../data/tips.dart';

class SelfDefenceTips extends StatefulWidget {
  static const String id = "SelfDefenceTips";

  const SelfDefenceTips({super.key});

  @override
  _SelfDefenceTipsState createState() => _SelfDefenceTipsState();
}

class _SelfDefenceTipsState extends State<SelfDefenceTips> {
  late List<Tip> _tips;

  ExpansionPanel _createTip(Tip tip) {
    return ExpansionPanel(
      headerBuilder: (context, bool isExpanded) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02,
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
          child: Row(
            children: [
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
                child: Image.asset(
                  tip.imgUrl,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height / 10.5,
                  width: MediaQuery.of(context).size.width / 3.5,
                ),
              ),
              Flexible(
                child: Text(
                  tip.title,
                  style: kBoldText,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02,
        ),
        child: Column(
          children: [
            Image.asset(
              tip.imgUrl,
              height: MediaQuery.of(context).size.height * 0.2,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              child: Text(
                tip.description,
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  color: const Color(0xFF123C69),
                ),
              ),
            ),
          ],
        ),
      ),
      isExpanded: tip.isExpanded,
    );
  }

  @override
  void initState() {
    _tips = getTips();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            "Self Defence Tips",
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
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02),
        children: [
          ExpansionPanelList(
            expandedHeaderPadding: EdgeInsets.zero,
            elevation: 0,
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _tips[index].isExpanded = !_tips[index].isExpanded;
              });
            },
            children: _tips.map(_createTip).toList(),
          ),
        ],
      ),
    );
  }
}
