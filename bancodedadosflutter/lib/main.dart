
import 'package:flutter/material.dart';
import 'banco_dados.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await BancoDados.abrirBanco();

  runApp(
    const MaterialApp(
      home: TelaBanco(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class TelaBanco extends StatefulWidget {
  const TelaBanco({super.key});

  @override
  State<TelaBanco> createState() => _TelaBancoState();
}

class _TelaBancoState extends State<TelaBanco> {
  final nomeController = TextEditingController();
  final cursoController = TextEditingController();

  List<Map<String, dynamic>> alunos = [];

  // Cadastrar aluno
  Future<void> cadastrarAluno() async {
    final nome = nomeController.text;
    final curso = cursoController.text;

    if (nome.isEmpty || curso.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha todos os campos!'),
        ),
      );
      return;
    }

    await BancoDados.cadastrar(nome, curso);

    nomeController.clear();
    cursoController.clear();

    await consultarAlunos();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Aluno cadastrado com sucesso!'),
      ),
    );
  }

  // Consultar alunos
  Future<void> consultarAlunos() async {
    final resultado = await BancoDados.consultar();

    setState(() {
      alunos = resultado;
    });
  }

  @override
  void dispose() {
    nomeController.dispose();
    cursoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste SQLite'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome do aluno',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: cursoController,
              decoration: const InputDecoration(
                labelText: 'Curso',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: cadastrarAluno,
              child: const Text('Cadastrar aluno'),
            ),

            ElevatedButton(
              onPressed: consultarAlunos,
              child: const Text('Consultar alunos'),
            ),

            const Divider(),

            Expanded(
              child: ListView.builder(
                itemCount: alunos.length,
                itemBuilder: (context, index) {
                  final aluno = alunos[index];

                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('${aluno['id']}'),
                    ),
                    title: Text(aluno['nome']),
                    subtitle: Text(aluno['curso']),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
