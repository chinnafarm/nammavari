// ignore_for_file: deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:nama_vari/constants/color.dart';

class Button extends StatelessWidget {
  const Button({super.key});

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
          Text('Add Amount Details',
              style: GoogleFonts.roboto(
                  color: primaryColor.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                  fontSize: 18 * textScaleFactor)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  _showDialogIncome(context);
                },
                child: Column(
                  children: [
                    const Icon(Icons.arrow_downward_sharp, color: Colors.green),
                    const SizedBox(height: 5),
                    Text(' Income',
                        style: GoogleFonts.roboto(
                            color: primaryColor.withOpacity(0.7),
                            fontWeight: FontWeight.w700,
                            fontSize: 15 * textScaleFactor)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  _showDialogExpense(context);
                },
                child: Column(
                  children: [
                    const Icon(Icons.arrow_upward_sharp, color: Colors.red),
                    const SizedBox(height: 5),
                    Text('Expense',
                        style: GoogleFonts.roboto(
                            color: primaryColor.withOpacity(0.7),
                            fontWeight: FontWeight.w700,
                            fontSize: 15 * textScaleFactor)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
void _showDialogIncome(BuildContext context) {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }
  }

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Income Details'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                  ),
                ),
                TextButton(
                  onPressed: () => selectDate(context),
                  child: const Text('Select Date'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                String name = nameController.text;
                String amount = amountController.text;
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(selectedDate);
                print('Name: $name, Amount: $amount, Date: $formattedDate');
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}

void _showDialogExpense(BuildContext context) {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }
  }

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Expense Details'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                  ),
                ),
                TextButton(
                  onPressed: () => selectDate(context),
                  child: const Text('Select Date'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                String name = nameController.text;
                String amount = amountController.text;
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(selectedDate);
                print('Name: $name, Amount: $amount, Date: $formattedDate');
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}