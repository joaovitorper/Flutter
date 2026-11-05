
import 'dart:io';
import 'package:path_provider/path_provider.dart';

// Função para salvar um arquivo
Future<void> salvarArquivo(String conteudo) async {
  try {
    final diretorio = await getApplicationDocumentsDirectory();

    final arquivo = File('${diretorio.path}/relatorio.txt');

    await arquivo.writeAsString(conteudo);
  } catch (e) {
    throw Exception('Erro ao salvar arquivo: $e');
  }
}

// Função para ler um arquivo
Future<String> lerArquivo() async {
  try {
    final diretorio = await getApplicationDocumentsDirectory();

    final arquivo = File('${diretorio.path}/relatorio.txt');

    if (await arquivo.exists()) {
      return await arquivo.readAsString();
    }

    return 'Arquivo não encontrado.';
  } catch (e) {
    return 'Erro ao ler arquivo: $e';
  }
}
