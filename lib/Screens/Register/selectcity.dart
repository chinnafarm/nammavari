import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nama_vari/constants/color.dart';

class SelectCity extends StatefulWidget {
  final TextEditingController citycontroller;
  const SelectCity({Key? key, required this.citycontroller}) : super(key: key);

  @override
  State<SelectCity> createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  String? selectedCity;
  final List<String> cities = [
    'Avani',
    'Edavakkudi',
    'Poovanatham',
    // Add more cities as needed
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.045; // Responsive font size

    return DropdownButtonFormField<String>(
      style: GoogleFonts.mukta(
        color: primaryColor.withOpacity(0.7),
        fontWeight: FontWeight.w500,
        fontSize: fontSize,
      ),
      value: selectedCity,
      onChanged: (newValue) {
        setState(() {
          selectedCity = newValue;
          widget.citycontroller.text = newValue ?? ''; // Update the TextEditingController
        });
      },
      items: cities.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: bordercolor, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: primaryColor, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: wrongcolor, width: 2.0),
        ),
        labelText: "Village",
        labelStyle: GoogleFonts.mukta(
          color: primaryColor.withOpacity(0.7),
          fontWeight: FontWeight.w500,
          fontSize: fontSize,
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: screenWidth * 0.01,
          horizontal: screenWidth * 0.02,
        ),
      ),
    );
  }
}
