// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nama_vari/Screens/Dashboard/bills.dart';
import 'package:nama_vari/Screens/Dashboard/dashboard.dart';
import 'package:nama_vari/Screens/Dashboard/profile.dart';
import 'package:nama_vari/Screens/Login/login.dart';
import 'package:nama_vari/constants/color.dart';


class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int _selectedIndex = 0;

  static  final List<Widget> _screens = <Widget>[
    const Dashboard(),
     BillsScreen(),
    const EditableListScreen(),
  ];

  static const List<String> _titles = <String>[
    'Home',
    'Bills',
    'Profile',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications, color: secondaryColor),
          )
        ],
        automaticallyImplyLeading: false,
        title: Text(
          _titles[_selectedIndex],
          style: GoogleFonts.roboto(
            color: secondaryColor,
            fontSize: 18 * textScaleFactor,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_sharp),
            label: 'Bills',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor.withOpacity(0.7),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
    goToLogin(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
}
