import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BancoDados {
  static Database? _banco;

  // Abrir banco de dados
  static Future<Database> abrirBanco() async {
    if (_banco != null) {
      return _banco!;
    }

    final caminho = join(
      await getDatabasesPath(),
      'escola.db',
    );

    // APAGA O BANCO ANTIGO (remover depois que funcionar)
    await deleteDatabase(caminho);

    _banco = await openDatabase(
      caminho,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE alunos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            curso TEXT NOT NULL
          )
        ''');
      },
    );

    print('Banco aberto com sucesso!');
    print('Local: $caminho');

    return _banco!;
  }

  // Cadastrar aluno
  static Future<int> cadastrar(
    String nome,
    String curso,
  ) async {
    final db = await abrirBanco();

    return await db.insert('alunos', {
      'nome': nome,
      'curso': curso,
    });
  }

  // Consultar alunos
  static Future<List<Map<String, dynamic>>> consultar() async {
    final db = await abrirBanco();

    return await db.query('alunos');
  }
}