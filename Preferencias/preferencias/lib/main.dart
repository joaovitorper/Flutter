
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'arquivo_dados.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaPreferencias(),
    ),
  );
}

class TelaPreferencias extends StatefulWidget {
  const TelaPreferencias({super.key});

  @override
  State<TelaPreferencias> createState() => _TelaPreferenciasState();
}

class _TelaPreferenciasState extends State<TelaPreferencias> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController relatorioController = TextEditingController();

  String nomeSalvo = '';
  String conteudoArquivo = '';

  Future<void> salvarNome() async {
    final preferencias = await SharedPreferences.getInstance();

    await preferencias.setString('nomeUsuario', nomeController.text);

    setState(() {
      nomeSalvo = nomeController.text;
    });
  }

  Future<void> carregarNome() async {
    final preferencias = await SharedPreferences.getInstance();

    setState(() {
      nomeSalvo = preferencias.getString('nomeUsuario') ?? '';
      nomeController.text = nomeSalvo;
    });
  }

  Future<void> salvarRelatorio() async {
    try {
      await salvarArquivo(relatorioController.text);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Relatório salvo com sucesso!')),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao salvar: $e')),
      );
    }
  }

  Future<void> carregarRelatorio() async {
    try {
      final conteudo = await lerArquivo();

      setState(() {
        conteudoArquivo = conteudo;
      });
    } catch (e) {
      setState(() {
        conteudoArquivo = 'Erro ao ler relatório: $e';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    carregarNome();
  }

  @override
  void dispose() {
    nomeController.dispose();
    relatorioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Preferências'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const Text(
              'Dados do usuário',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Digite seu nome',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: ElevatedButton.icon(
                onPressed: salvarNome,
                icon: const Icon(Icons.save),
                label: const Text('Salvar nome'),
              ),
            ),

            const SizedBox(height: 15),

            Text(
              'Nome salvo: $nomeSalvo',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),

            const Divider(height: 45),

            const Text(
              'Armazenamento em arquivos',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: relatorioController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Digite o relatório',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.description),
                alignLabelWithHint: true,
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton.icon(
              onPressed: salvarRelatorio,
              icon: const Icon(Icons.save),
              label: const Text('Salvar relatório'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(15),
              ),
            ),

            const SizedBox(height: 15),

            ElevatedButton.icon(
              onPressed: carregarRelatorio,
              icon: const Icon(Icons.folder_open),
              label: const Text('Ler relatório'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(15),
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Conteúdo do arquivo:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Text(
                conteudoArquivo.isEmpty
                    ? 'Nenhum relatório carregado.'
                    : conteudoArquivo,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
