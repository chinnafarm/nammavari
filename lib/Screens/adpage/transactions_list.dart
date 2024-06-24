// ignore_for_file: deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:nama_vari/constants/color.dart';

import 'transaction_item.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    var textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Transactions',
              style: GoogleFonts.roboto(
                  color: primaryColor.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                  fontSize: 18 * textScaleFactor)),
          const SizedBox(height: 10),
          const Column(
            children: [
              TransactionItem(
                name: 'Temple Construction',
                date: 'May 21, 2023',
                amount: '₹200,000',
              ),
              TransactionItem(
                name: 'Donation',
                date: 'May 20, 2023',
                amount: '₹50,000',
              ),
              TransactionItem(
                name: 'Event Expense',
                date: 'May 19, 2023',
                amount: '₹10,000',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
