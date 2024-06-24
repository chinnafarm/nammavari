// ignore_for_file: unused_local_variable, avoid_print, library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nama_vari/Screens/Social/social.dart';
import 'package:nama_vari/Screens/list/list.dart';
import 'package:nama_vari/constants/banner/tpromoslider.dart';
import 'package:nama_vari/constants/color.dart';
import 'package:nama_vari/constants/images.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<String> _data =
      List<String>.generate(20, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Stack(children: [
      Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Column(children: [
              TPromoSlider(
                screenHeight: screenHeight,
                banners: const [TImage.banner1, TImage.banner2, TImage.banner3],
              ),
              SizedBox(height: screenHeight * 0.02),
              const DetailsCard(),
              SizedBox(height: screenHeight * 0.02),
              const ButtonRow(),
              SizedBox(height: screenHeight * 0.02),
              Container(
                constraints: BoxConstraints(
                  maxHeight: screenHeight * 0.4,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: _data.map((item) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.01,
                            horizontal: screenWidth * 0.02),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.02),
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Text(item),
                          onTap: () {
                            // Handle tap event
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
      Positioned(
        bottom: screenHeight * 0.05,
        right: screenWidth * 0.05,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          onPressed: () {
            _showLongTextboxDialog(context);
          },
          tooltip: 'Upload Media',
          backgroundColor: primaryColor,
          child: const Icon(
            Icons.add,
            color: secondaryColor,
          ),
        ),
      ),
    ]);
  }
}

void _showLongTextboxDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Enter Text',
          style: GoogleFonts.lato(
              color: primaryColor, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: TextField(
            maxLines: null,
            keyboardType: TextInputType.multiline,
            style: GoogleFonts.mukta(
                color: primaryColor.withOpacity(0.7),
                fontWeight: FontWeight.w500,
                fontSize: 17),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: bordercolor, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: primaryColor, width: 2.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: wrongcolor, width: 2.0),
              ),
              labelText: "Enter your things here",
              labelStyle: GoogleFonts.mukta(
                  color: primaryColor.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Add functionality to handle the entered text
              Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}

class DetailsCard extends StatefulWidget {
  const DetailsCard({super.key});

  @override
  State<DetailsCard> createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;
  

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36), // Adjust the value as needed
        color: primaryColor, // Optional color
      ),
      padding: const EdgeInsets.all(16.0),
      child: ExpansionTile(
         iconColor: secondaryColor, // Color of the arrow when expanded
        collapsedIconColor: secondaryColor, // Color of the arrow when collapsed
        title: Text(
          '₹2,40,081',
          style: GoogleFonts.mukta(
            color: secondaryColor,
            fontSize: 30 * textScaleFactor,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Income',
          style: GoogleFonts.lato(
            color: secondaryColor,
            fontSize: 18 * textScaleFactor,
            fontWeight: FontWeight.bold,
          ),
        ),
        children: [
          const SizedBox(height: 30),
          
        
          Text(
            '₹2,40,081',
            style: GoogleFonts.mukta(
              color: secondaryColor,
              fontSize: 20 * textScaleFactor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Balance Amount',
            style: GoogleFonts.lato(
              color: secondaryColor,
              fontSize: 18 * textScaleFactor,
              fontWeight: FontWeight.bold,
            ),
          ),
  const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    '₹4,00,000',
                    style: GoogleFonts.mukta(
                      color: secondaryColor,
                      fontSize: 22 * textScaleFactor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Total Cash Flow',
                    style: GoogleFonts.lato(
                      color: secondaryColor,
                      fontSize: 18 * textScaleFactor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '₹1,59,919',
                    style: GoogleFonts.mukta(
                      color: secondaryColor,
                      fontSize: 22 * textScaleFactor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Expenses',
                    style: GoogleFonts.lato(
                      color: secondaryColor,
                      fontSize: 18 * textScaleFactor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ButtonRow extends StatefulWidget {
  const ButtonRow({super.key});

  @override
  _ButtonRowState createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: primaryColor.withOpacity(0.3),
          ),
          padding: EdgeInsets.symmetric(
              vertical: screenWidth * 0.01, horizontal: screenWidth * 0.02),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: secondaryColor,
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.06,
                      vertical: screenWidth * 0.015),
                  textStyle: TextStyle(fontSize: 16.0 * textScaleFactor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListScreen()));
                },
                child: Text(
                  'Lists',
                  style: GoogleFonts.mukta(
                      color: secondaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 17 * textScaleFactor),
                ),
              ),
              SizedBox(width: screenWidth * 0.02),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: secondaryColor,
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.06,
                      vertical: screenWidth * 0.015),
                  textStyle: TextStyle(fontSize: 16.0 * textScaleFactor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SocialScreen()));
                },
                child: Text(
                  'Social',
                  style: GoogleFonts.mukta(
                      color: secondaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 17 * textScaleFactor),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
