import 'package:flutter/material.dart';

import 'Banco_dados.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await BancoDados.abrirBanco();

  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
        child: Text('Banco SQlite iniciado!', style: TextStyle(fontSize: 22)),  
        ),
      ),
    )

  );
}