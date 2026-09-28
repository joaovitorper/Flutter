import 'package:flutter/material.dart';
void main(){
  runApp(
    MaterialApp(
      home:Scaffold(
     appBar: AppBar(title: Text('Meu Perfil')),
     body: Column(
      children: [
        Text('João Vítor Pereira Paulo'),
        SizedBox(height: 20),
        Text('Técnico em informática pra Internet'),
        ElevatedButton(onPressed:() {}, child: Text('Sobre mim')),
           Text('Bom meu nome e João e gosto muito de Programação.'),
          SizedBox(height: 20),
          Text('Texto Colorido', style: TextStyle(color:Colors.green )
          )

      ],
      ),
    ),
  ),
  );
}