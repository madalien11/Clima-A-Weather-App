import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Jura-VariableFont',
  fontWeight: FontWeight.w200,
  fontSize: 120.0,
);

TextStyle kTempTextStyle2 = GoogleFonts.jura(
  fontSize: 145,
  fontWeight: FontWeight.w100,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Jura-VariableFont',
  fontWeight: FontWeight.w300,
  fontSize: 45.0,
);

TextStyle kMessageTextStyle2 = GoogleFonts.jura(
  fontSize: 45,
  fontWeight: FontWeight.w300,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 70.0,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white70,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
    borderSide: BorderSide.none,
  ),
);
