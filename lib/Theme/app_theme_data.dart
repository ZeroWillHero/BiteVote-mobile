import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFFF89D3A), // Primary Orange
  scaffoldBackgroundColor: Colors.white, // Background
  
  // AppBar Theme
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
  ),

  // Text Theme
  textTheme: TextTheme(
    headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
    bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
  ),

  // Button Theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent, // Button color
      foregroundColor: Colors.white, // Text color
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),

  // Input Field Theme
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFFEDEDED), // Light Gray background
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Color(0xFFF89D3A)), // Focused color
    ),
    hintStyle: TextStyle(color: Colors.black45),
  ),

  // Card Theme
  cardColor: Color(0xFFF8F8F8), // Off-white
  dividerColor: Colors.grey[300],

  // Bottom Navigation Bar Theme
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Color(0xFFF89D3A),
    unselectedItemColor: Colors.black54,
  ),
);
