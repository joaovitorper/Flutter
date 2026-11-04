
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BancoDados {
  static Future<Database> abrirBanco() async {
    final caminho = join(
      await getDatabasesPath(),
      'escola.db',
    );

    final banco = await openDatabase(
      caminho,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE alunos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            idade INTEGER NOT NULL,
            curso TEXT NOT NULL
          )
        ''');
      },
    );

    print('Banco de dados aberto com sucesso!');
    print('Local do banco: $caminho');

    return banco;
  }
}

