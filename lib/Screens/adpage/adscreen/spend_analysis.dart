// ignore_for_file: deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nama_vari/constants/color.dart';

class SpendAnalysis extends StatelessWidget {
  const SpendAnalysis({super.key});

  @override
  Widget build(BuildContext context) {
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Spend Analysis',
              style: GoogleFonts.roboto(
                  color: primaryColor.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                  fontSize: 18 * textScaleFactor)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Icon(Icons.temple_hindu, color: Colors.orange),
                  const SizedBox(height: 5),
                  Text('32%',
                      style: GoogleFonts.roboto(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16 * textScaleFactor)),
                  Text('Temple',
                      style: GoogleFonts.roboto(
                          color: primaryColor.withOpacity(0.7),
                          fontWeight: FontWeight.bold,
                          fontSize: 12 * textScaleFactor)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
