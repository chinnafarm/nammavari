

import 'package:flutter/material.dart';
import 'package:nama_vari/Screens/Dashboard/profileedit.dart';
import 'package:nama_vari/Screens/Login/login.dart';
import 'package:nama_vari/constants/color.dart';

class EditableListScreen extends StatefulWidget {
  const EditableListScreen({super.key});

  @override
  State<EditableListScreen> createState() => _EditableListScreenState();
}

class _EditableListScreenState extends State<EditableListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildProfileHeader(),
        
          _buildListItem(Icons.notifications, 'Notifications',(){}),
          
          _buildListItem(Icons.description, 'Terms of Service',(){}),
         
          _buildListItem(Icons.exit_to_app, 'Log out',(){Navigator.push(context, MaterialPageRoute(builder:(context)=>Login()));}),
          _buildHelpButton(context),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
              'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?t=st=1717146128~exp=1717149728~hmac=6e944cb533be4811f38e4cc3206bfa0af3f99c61e50dfca398db3a9a8cf2749b&w=996'), // Replace with actual image URL
        ),
        SizedBox(height: 10),
        Text(
          'Anna Miller',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text('anna@profile.com'),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Profileedit()));
          },
          child: Text('Edit Profile'),
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: secondaryColor // background color
              ),
        ),
      ],
    );
  }

  Widget _buildListItem(IconData icon, String title,VoidCallback? onTap , [String? subtitle]) {
    return    ListTile(
      leading: Icon(icon, color: primaryColor),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
     onTap: onTap,
    );
  }

  Widget _buildHelpButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        onPressed: () {
          // Handle help button press
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.help_outline),
            SizedBox(width: 10),
            Text('How can we help you?'),
          ],
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: primaryColor,
          backgroundColor: Colors.white12, // text color
        ),
      ),
    );
  }
}
