import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nama_vari/constants/color.dart';

class LoginButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onpressed;

  const LoginButton({
    Key? key,
    required this.buttonText,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.zero, // Ensures the gradient fills the entire button
        ),
        child: Ink(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: double.infinity,
            height: 40,
            alignment: Alignment.center,
            child: Text(
              buttonText,
              style: GoogleFonts.mukta(
                color: secondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
