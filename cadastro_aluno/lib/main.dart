import 'package:cadastro_aluno/views/tela_aluno.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MeuApp());
}
class MeuApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaAluno(

      ),
    );
  }
}