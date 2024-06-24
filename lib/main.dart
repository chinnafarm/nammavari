
// ignore_for_file: unused_import, depend_on_referenced_packages

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nama_vari/Screens/Login/login.dart';


void main() async {


  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Namma Vari',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Login(),
    );
  }
}

