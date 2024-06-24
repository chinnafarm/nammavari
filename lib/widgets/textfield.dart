// ignore_for_file: void_checks

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nama_vari/constants/color.dart';

class textfield extends StatelessWidget {
  const textfield({
    super.key,
    required TextEditingController controller,
    required this.screenWidth, required this.labeltext,
  }) : _controller = controller;

  final TextEditingController _controller;
  final double screenWidth;
  final String labeltext;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      style: GoogleFonts.mukta(
        color: primaryColor.withOpacity(0.7),
        fontWeight: FontWeight.w500,
        fontSize: screenWidth * 0.045,
      ),
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
        labelText: labeltext,
        labelStyle: GoogleFonts.mukta(
          color: primaryColor.withOpacity(0.7),
          fontWeight: FontWeight.w500,
          fontSize: screenWidth * 0.045,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
      ),
    );
  }
}
