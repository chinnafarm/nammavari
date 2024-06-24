import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nama_vari/Screens/adpage/addmoney.dart';
import 'package:nama_vari/Screens/adpage/adscreen/spend_analysis.dart';
import 'package:nama_vari/Screens/adpage/transactions_list.dart';
import 'package:nama_vari/constants/color.dart';

class MoneyScreen extends StatelessWidget {
  const MoneyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout_sharp,
                color: secondaryColor,
              ))
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: secondaryColor,
          ),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          'Admin Panel',
          style: GoogleFonts.mukta(
              color: secondaryColor,
              fontSize: 18 * textScaleFactor,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: primaryColor,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    '₹2,40,081',
                    style: GoogleFonts.mukta(
                        color: secondaryColor,
                        fontSize: 30 * textScaleFactor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Total cash flow',
                    style: GoogleFonts.lato(
                        color: secondaryColor,
                        fontSize: 18 * textScaleFactor,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            '₹4,00,000',
                            style: GoogleFonts.mukta(
                                color: secondaryColor,
                                fontSize: 22 * textScaleFactor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Income',
                            style: GoogleFonts.lato(
                                color: secondaryColor,
                                fontSize: 18 * textScaleFactor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '₹1,59,919',
                            style: GoogleFonts.mukta(
                                color: secondaryColor,
                                fontSize: 22 * textScaleFactor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Expenses',
                            style: GoogleFonts.lato(
                                color: secondaryColor,
                                fontSize: 18 * textScaleFactor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Button(),
                  SizedBox(height: 20),
                  SpendAnalysis(),
                  SizedBox(height: 20),
                  TransactionsList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
