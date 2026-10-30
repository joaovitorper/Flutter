import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Biblioteca

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget{
const MeuApp({super.key});

@override
  Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Consulta de usuário',
    theme: ThemeData(colorSchemeSeed:Colors.blue, useMaterial3: true),
    home: const TelaUsuarios(),
  );
  }
}

class TelaUsuarios extends StatefulWidget {
  const TelaUsuarios({super.key});

  @override
  State<TelaUsuarios> createState() => _TelaUsuariosState();
}

class _TelaUsuariosState extends State<TelaUsuarios>{
late Future<List<dynamic>> usuarios;

@override 
void initState(){
  super.initState();
  usuarios =buscarUsuarios();

}

Future<List<dynamic>> buscarUsuarios() async{
  final url = Uri.parse('https://jasnplaceholder.typicode.com/users');
 
  final resposta = await http.get(url);

if(resposta.statusCode == 200){
  return jsonDecode(resposta.body) as List<dynamic>;
}else{
  throw Exception('Não foi possivel carregar o usuarios');
}
}

@override
 Widget build(BuildContext context){
  return Scaffold(
    appBar:AppBar(title: const Text('Usuarios Cadastrados')),
    body: FutureBuilder<List<dynamic>>(
      future: usuarios,
      builder: (context, snapshot){
        
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }

        if(snapshot.hasError){
          return const Center(child: Text('Erro ao cadastrar os Dados'));
        }

        final lista = snapshot.data!;

        return ListView.builder(
         itemCount: lista.length,  
          itemBuilder: (context, index){
            final usuario = lista[index];

            return ListTile(
              leading: CircleAvatar(child: Text('${usuario['id']}')),
              title: Text(usuario['name']),
              subtitle: Text(usuario['email']),
              trailing: const Icon(Icons.person),
            );
          },
        );
      },
    )
  );
 }
}
