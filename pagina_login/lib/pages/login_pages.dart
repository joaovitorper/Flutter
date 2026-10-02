import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPages extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  final TextEditingController nomeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 211, 215, 250),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
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
                TextField(
                controller: nomeController,
                decoration: const InputDecoration(
                hintText: 'Digite seu nome',
                border: OutlineInputBorder(),
              ),
            ),


                 
                TextField(
                controller: nomeController,
                decoration: const InputDecoration(
                hintText: 'Digite sua Senha',
                border: OutlineInputBorder(),
              ),
            ),

                ],
              ),
              Column(
                spacing: 40,
                children: [
                
                // BOTÃO CONTINUAR
            SizedBox(
              height: 50,
              child: OutlinedButton(
                onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SegundaTela(),
                    ),
                  );

                },

                child: const Text(
                  'CONTINUAR',
                  style: TextStyle(
                    fontSize: 16,
                  ),
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
class SegundaTela extends StatelessWidget {
  const SegundaTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segunda Tela'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(30),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [

            const Text(
              '🎉',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 60,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Você chegou à segunda tela!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Essa tela foi aberta através de uma ação do usuário.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {

                  Navigator.pop(context);

                },

                child: const Text(
                  'VOLTAR',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
