
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MaterialApp(
    home: TelaPreferencias(),
    debugShowCheckedModeBanner: false,
  ));
}

class TelaPreferencias extends StatefulWidget {
  const TelaPreferencias({super.key});

  @override
  State<TelaPreferencias> createState() =>
      _TelaPreferenciasState();
}

class _TelaPreferenciasState extends State<TelaPreferencias> {
  final TextEditingController nomeController =
      TextEditingController();

  String nomeSalvo = '';

  // Salvar nome
  Future<void> salvarNome() async {
    final preferencias =
        await SharedPreferences.getInstance();

    await preferencias.setString(
      'nomeUsuario',
      nomeController.text,
    );

    setState(() {
      nomeSalvo = nomeController.text;
    });
  }

  // Carregar nome salvo
  Future<void> carregarNome() async {
    final preferencias =
        await SharedPreferences.getInstance();

    setState(() {
      nomeSalvo =
          preferencias.getString('nomeUsuario') ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    carregarNome();
  }

  @override
  void dispose() {
    nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferências'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Digite seu nome',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: salvarNome,
              child: const Text('Salvar nome'),
            ),
            const SizedBox(height: 20),
            Text('Nome salvo: $nomeSalvo'),
          ],
        ),
      ),
    );
  }
}
