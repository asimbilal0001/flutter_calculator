import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_calculator/Utils/app_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_calculator/Views/display.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'THE CALCULATOR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          titleTextStyle: GoogleFonts.lato(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: const DisplayScreen(),
    );
  }
}
