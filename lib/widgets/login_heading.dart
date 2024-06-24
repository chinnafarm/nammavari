// ignore_for_file: unused_local_variable, void_checks, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nama_vari/constants/color.dart';

class LoginHeading extends StatelessWidget {
  const LoginHeading({
    super.key,
    required this.size, required this.heading,
  });

  final Size size;
  final String heading;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        heading,
        style: GoogleFonts.mukta(
          color: primaryColor,
          fontSize: size.width * 0.08,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}