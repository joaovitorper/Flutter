
import 'package:cadastro_aluno/controllers/aluno_controllers.dart';
import 'package:flutter/material.dart';

class TelaAluno extends StatefulWidget {
  const TelaAluno({super.key});

  @override
  State<TelaAluno> createState() => _TelaAlunoState();
}

class _TelaAlunoState extends State<TelaAluno> {
  final TextEditingController nomeController =
      TextEditingController();
  final TextEditingController cursoController =
      TextEditingController();
  final TextEditingController idadeController =
      TextEditingController();
  final TextEditingController outroPronomeController =
      TextEditingController();

  final AlunoControllers controller = AlunoControllers();

  String resultado = '';
  String? pronomeSelecionado;

  bool alunoSelecionado = true;
  bool alunaSelecionada = false;

  void cadastrar() {
    controller.cadastrar(
      nomeController.text,
      cursoController.text,
      idadeController.text,
    );

    setState(() {
      String genero =
          alunaSelecionada ? 'Feminino' : 'Masculino';

      resultado = controller.mostrarAluno(genero);
    });
  }

  void limparTudo() {
    setState(() {
      nomeController.clear();
      cursoController.clear();
      idadeController.clear();
      outroPronomeController.clear();

      pronomeSelecionado = null;
      alunoSelecionado = true;
      alunaSelecionada = false;
      resultado = '';
    });
  }

  @override
  void dispose() {
    nomeController.dispose();
    cursoController.dispose();
    idadeController.dispose();
    outroPronomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const azul = Color.fromARGB(255, 204, 223, 240);

    return Scaffold(
      backgroundColor: azul,

      appBar: AppBar(
        backgroundColor: azul,
        foregroundColor: Colors.black87,
        title: const Text('Cadastro de Estudante'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campo Nome
            TextField(
              controller: nomeController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                labelText: 'Nome',
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: nomeController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        tooltip: 'Limpar nome',
                        onPressed: () {
                          setState(() {
                            nomeController.clear();
                          });
                        },
                      )
                    : null,
              ),
            ),

            const SizedBox(height: 15),

            // Campo Curso
            TextField(
              controller: cursoController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                labelText: 'Curso',
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: cursoController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        tooltip: 'Limpar curso',
                        onPressed: () {
                          setState(() {
                            cursoController.clear();
                          });
                        },
                      )
                    : null,
              ),
            ),

            const SizedBox(height: 15),

            // Campo Idade
            TextField(
              controller: idadeController,
              keyboardType: TextInputType.number,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                labelText: 'Idade',
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: idadeController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        tooltip: 'Limpar idade',
                        onPressed: () {
                          setState(() {
                            idadeController.clear();
                          });
                        },
                      )
                    : null,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Como deseja ser identificado?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Aluno'),
              value: alunoSelecionado,
              onChanged: (valor) {
                setState(() {
                  alunoSelecionado = true;
                  alunaSelecionada = false;
                });
              },
            ),

            CheckboxListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Aluna'),
              value: alunaSelecionada,
              onChanged: (valor) {
                setState(() {
                  alunoSelecionado = false;
                  alunaSelecionada = true;
                });
              },
            ),

            const SizedBox(height: 20),

            const Text(
              'Quais pronomes você utiliza?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            RadioListTile<String>(
              contentPadding: EdgeInsets.zero,
              title: const Text('ele/dele'),
              value: 'ele/dele',
              groupValue: pronomeSelecionado,
              onChanged: (valor) {
                setState(() {
                  pronomeSelecionado = valor;
                });
              },
            ),

            RadioListTile<String>(
              contentPadding: EdgeInsets.zero,
              title: const Text('ela/dela'),
              value: 'ela/dela',
              groupValue: pronomeSelecionado,
              onChanged: (valor) {
                setState(() {
                  pronomeSelecionado = valor;
                });
              },
            ),

            RadioListTile<String>(
              contentPadding: EdgeInsets.zero,
              title: const Text('Outro'),
              value: 'outro',
              groupValue: pronomeSelecionado,
              onChanged: (valor) {
                setState(() {
                  pronomeSelecionado = valor;
                });
              },
            ),

            // Campo para outros pronomes
            if (pronomeSelecionado == 'outro')
              TextField(
                controller: outroPronomeController,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  labelText: 'Informe seus pronomes',
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon:
                      outroPronomeController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              tooltip: 'Limpar pronomes',
                              onPressed: () {
                                setState(() {
                                  outroPronomeController.clear();
                                });
                              },
                            )
                          : null,
                ),
              ),

            const SizedBox(height: 20),

            // Botão Cadastrar
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black87,
                ),
                onPressed: cadastrar,
                child: const Text('Cadastrar'),
              ),
            ),

            const SizedBox(height: 8),

            // Botão Limpar tudo
            Center(
              child: TextButton.icon(
                onPressed: limparTudo,
                icon: const Icon(Icons.delete_outline),
                label: const Text('Limpar tudo'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Resultado do cadastro:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(resultado),

            const SizedBox(height: 10),

            Text(
              'Pronomes: ${pronomeSelecionado == 'outro'
                  ? (outroPronomeController.text.isEmpty
                      ? 'Não informado'
                      : outroPronomeController.text)
                  : pronomeSelecionado ?? 'Não informado'}',
            ),
          ],
        ),
      ),
    );
  }
}