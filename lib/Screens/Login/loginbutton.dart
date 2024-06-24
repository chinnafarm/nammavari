// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nama_vari/constants/color.dart';

class CustomTextButton extends StatefulWidget {
  final String text;
  final Widget navigateTo;

  const CustomTextButton({
    Key? key,
    required this.text,
    required this.navigateTo,
  }) : super(key: key);

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: TextButton(
        onPressed: () {
          // Navigate to the specified screen when the button is pressed.
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.navigateTo),
          );
        },
        child: Text(
          widget.text,
          style: GoogleFonts.mukta(
            color: isHovered ? primaryColor.withOpacity(0.8) : primaryColor, // Change color on hover
            fontSize: screenWidth * 0.045, // Responsive font size
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
