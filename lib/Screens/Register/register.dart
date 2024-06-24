// ignore_for_file: unused_local_variable, void_checks, avoid_print, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:nama_vari/Screens/Login/login.dart';
import 'package:nama_vari/Screens/Login/loginbutton.dart';
import 'package:nama_vari/Screens/Register/selectcity.dart';
import 'package:nama_vari/constants/color.dart';
import 'package:nama_vari/widgets/Button/loginbutton.dart';
import 'package:nama_vari/widgets/textfield.dart';

import '../../widgets/login_heading.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _citycontroler = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  Future<void> registerUser(
    String username, String password, String email, String city) async {
  final String apiUrl = "http://127.0.0.1:8000/api/register";

  final Map<String, dynamic> requestBody = {
    'name': username,
    'email': email,
    'city': city,
    'password': password,
  };

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      print("User registered successfully");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registered Successfully')),
      );
      Navigator.pop(context);
    } else {
      print("Failed to register user: ${response.statusCode}");
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to register user: ${response.statusCode}')),
      );
    }
  } catch (e) {
    print("Error occurred: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('An error occurred. Please try again.')),
    );
  }
}

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
                width: size.width,
                height: size.height,
                fit: BoxFit.cover,
              ),
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
                padding: EdgeInsets.only(top: size.height * 0.38),
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
                        horizontal: size.width * 0.08,
                        vertical: size.height * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(height: size.height * 0.02),
                        LoginHeading(size: size, heading: 'Register',),
                        SizedBox(height: size.height * 0.02),
                        textfield(controller: _usernamecontroller, screenWidth: screenWidth, labeltext: 'Email'),
                        SizedBox(height: size.height * 0.02),
                        SelectCity(citycontroller: _citycontroler),
                        SizedBox(height: size.height * 0.02),
                       textfield(controller: _emailcontroller, screenWidth: screenWidth, labeltext: 'Username'),
                        SizedBox(height: size.height * 0.02),
                        textfield(controller: _passwordcontroller, screenWidth: screenWidth, labeltext: 'Password'),
                        SizedBox(height: size.height * 0.04),
                        Center(
                          child: LoginButton(
                            buttonText: "Register",
                            onpressed: () {
                              String name = _usernamecontroller.text;
                              String email = _emailcontroller.text;
                              String city = _citycontroler.text;
                              String password = _passwordcontroller.text;
                              if (name.isNotEmpty && password.isNotEmpty &&
                                  email.isNotEmpty && city.isNotEmpty) {
                                registerUser(name, password, email, city);
                              } else {
                                // Show a message to the user if any field is empty
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Please fill in all fields')),
                                );
                              }
                            }, // Pass function reference
                          ),
                        ),
                        SizedBox(height: size.height * 0.04),
                        const Center(
                          child: CustomTextButton(
                            text: "Already have an Account? Go to Login",
                            navigateTo: Login(),
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
