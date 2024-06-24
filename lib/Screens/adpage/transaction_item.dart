// ignore_for_file: deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionItem extends StatelessWidget {
  final String name;
  final String date;
  final String amount;

  const TransactionItem({
    Key? key,
    required this.name,
    required this.date,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 16 * textScaleFactor)),
              Text(date,
                  style: GoogleFonts.roboto(
                      color: Colors.grey,
                      fontSize: 14 * textScaleFactor)),
            ],
          ),
          Text(amount,
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 16 * textScaleFactor)),
        ],
      ),
    );
  }
}
