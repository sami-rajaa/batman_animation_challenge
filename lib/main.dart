import 'package:batman_animation_challenge/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.vidalokaTextTheme(),
        primaryColor: const Color(0XFFC8B853),
      ),
      home: const BatmanScreen(),
    );
  }
}
