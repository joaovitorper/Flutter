import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPages extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 211, 215, 250),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(40, 100, 40, 200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              Container(
                width: 200,
                height: 200,
                color: Color.fromARGB(255, 51, 90, 139),
                
                ),
              Column(
                spacing: 20,
                children: [
                  Container(
                    // input email
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
                    decoration: BoxDecoration(
                   color: Color(0xFFE5E6F2),
                   borderRadius: BorderRadius.circular(3), 
                   border: Border.all(
                    color: Color(0xff535B9E),
                    width: 0.2,
                    
                    
                   )
                    ),
                    child: Text("Digite Seu Email",
                     style: GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight(400),
                     ),
                    
                  ),
                  ),
                  Container(
                    // input senha 
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
                    decoration: BoxDecoration(
                   color: Color(0xFFE5E6F2),
                   borderRadius: BorderRadius.circular(3), 
                   border: Border.all(
                    color: Color(0xff535B9E),
                    width: 0.2,
                    
                    
                   )
                    ),
                    child: Text("Digite Sua Senha",
                     style: GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight(400),
                     ),
                  
                    
                  ),
                  ),
                ],
              ),
              Column(
                spacing: 40,
                children: [
                  Container(
                    // Botão Login
                    padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
                    decoration: BoxDecoration(
                   color: Color(0xff244977),
                   borderRadius: BorderRadius.circular(10), 
                   border: Border.all(
                    color: Color(0xff535B9E),
                    width: 0.2,
                    
                    
                   )
                    ),
                    child: Text("Login",
                     style: GoogleFonts.inter(fontSize: 24,fontWeight: FontWeight(800), color: Color(0xffffffff)
                     ),
                  
                    
                  ),
                  ),
                  //Botão cadastro
                  Text("Cadastro",
                   style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight(500), 
                    color: Color(0xFF0B59BC),
                   decoration: TextDecoration.underline,
                   decorationColor: Color(0xFF0B59BC),
                   ),
                   ),
                ],
              ),                
            ],
          ),
        ),
      ),
    );
  }
}