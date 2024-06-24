import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nama_vari/constants/color.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key, Key? key1});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final List<String> _data = List<String>.generate(20, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: secondaryColor),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications, color: secondaryColor),
          )
        ],
        automaticallyImplyLeading: false,
        title: Text(
          'Lists',
          style: GoogleFonts.roboto(
            color: secondaryColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _data.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.red.withOpacity(0.7),
                  ),
                  leading: const Icon(
                    Icons.account_balance_wallet_rounded,
                    color: primaryColor,
                  ),
                  title: Text(
                    item,
                    style: GoogleFonts.roboto(
                      color: primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    // Handle tap event
                  },
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
