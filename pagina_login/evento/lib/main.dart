import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const TelaInicial(),
    );
  }
}

// =====================================================
// TELA INICIAL
// =====================================================

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  final TextEditingController nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu App'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(30),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const SizedBox(height: 40),

            const Text(
              '👋',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 45,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Seja bem-vindo!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Digite seu nome para começar',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 40),

            const Text(
              'Nome',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                hintText: 'Digite seu nome',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            // BOTÃO SAUDAR
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {

                  if (nomeController.text.isEmpty) {

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Digite seu nome primeiro!',
                        ),
                      ),
                    );

                  } else {

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Olá, ${nomeController.text}!',
                        ),
                      ),
                    );

                  }
                },

                child: const Text(
                  'SAUDAR',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

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
          ],
        ),
      ),
    );
  }
}

// =====================================================
// SEGUNDA TELA
// =====================================================

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