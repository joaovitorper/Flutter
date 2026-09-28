import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pagina_login/pages/login_pages.dart';

class MeuApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:LoginPages(),
      theme:ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: GoogleFonts. interTextTheme()

      ),
      
    );
  }
}