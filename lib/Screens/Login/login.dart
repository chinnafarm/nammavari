// ignore_for_file: void_checks

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nama_vari/Screens/Dashboard/bottomnavigation.dart';
import 'package:nama_vari/Screens/Login/loginbutton.dart';
import 'package:nama_vari/Screens/Register/register.dart';
import 'package:nama_vari/Screens/adpage/ad.dart';
import 'package:nama_vari/constants/color.dart';
import 'package:nama_vari/constants/icons.dart';
import 'package:nama_vari/widgets/Button/loginbutton.dart';
import 'package:nama_vari/widgets/login_heading.dart';

import '../../widgets/textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Image.asset(
                  'assests/images/Loginimage.jpg',
                  height: screenHeight,
                  width: screenWidth,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.06, left: size.width * 0.08),
                      child: Text(
                        "Hello.",
                        style: GoogleFonts.raleway(
                          fontSize: size.width * 0.13,
                          color: secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.15, left: size.width * 0.08),
                  child: Text(
                    "Register to your account",
                    style: GoogleFonts.raleway(
                      fontSize: size.width * 0.09,
                      color: secondaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.45),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.07,
                          vertical: screenHeight * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          LoginHeading(size: size, heading: 'Login'),
                          SizedBox(height: size.height * 0.02),
                          textfield(
                              controller: _email,
                              screenWidth: screenWidth,
                              labeltext: 'Email'),
                          SizedBox(height: size.height * 0.02),
                          textfield(
                              controller: _password,
                              screenWidth: screenWidth,
                              labeltext: 'Password'),
                          SizedBox(height: size.height * 0.02),
                          LoginButton(
                              buttonText: "Login",
                              onpressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BottomNavigation()));
                              }),
                          SizedBox(height: size.height * 0.02),
                          Center(
                            child: CustomTextButton(
                              text: "Don't have an account ? Please Register",
                              navigateTo: RegistrationScreen(),
                            ),
                          ),
                          SizedBox(height: size.height * 0.002),
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  thickness: 1,
                                  color: primaryColor,
                                  endIndent: 10,
                                ),
                              ),
                              Text(
                                "  Admin Sign In  ",
                                style: GoogleFonts.mukta(
                                    color: primaryColor, fontSize: 18),
                              ),
                              Expanded(
                                child: Divider(
                                  thickness: 1,
                                  color: primaryColor,
                                  indent: 10,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.007),
                          Center(
                            child: Material(
                              color: primaryColor,
                              elevation: 8,
                              borderRadius: BorderRadius.circular(10),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const AdPage(),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  AppIcons.arrow,
                                  color: secondaryColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.04),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
