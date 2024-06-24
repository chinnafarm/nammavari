import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nama_vari/constants/color.dart';

class admin_common extends StatelessWidget {
  const admin_common({
    super.key,
    required this.textScaleFactor,
  });

  final double textScaleFactor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            '₹2,40,081',
            style: GoogleFonts.mukta(
                color: secondaryColor,
                fontSize: 30 * textScaleFactor,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'Total cash flow',
            style: GoogleFonts.lato(
                color: secondaryColor,
                fontSize: 18 * textScaleFactor,
                fontWeight: FontWeight.bold),
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
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Income',
                    style: GoogleFonts.lato(
                        color: secondaryColor,
                        fontSize: 18 * textScaleFactor,
                        fontWeight: FontWeight.bold),
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
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Expenses',
                    style: GoogleFonts.lato(
                        color: secondaryColor,
                        fontSize: 18 * textScaleFactor,
                        fontWeight: FontWeight.bold),
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