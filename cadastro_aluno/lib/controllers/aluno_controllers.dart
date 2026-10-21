import '../models/aluno.dart';

class AlunoControllers {
  Aluno? aluno;

  void cadastrar(String nome, String curso, String idade) {
    aluno = Aluno(nome, curso, idade);
  }

  String mostrarAluno(String genero) {
    if (aluno == null) {
      return "";
    }

    String tratamento = genero == 'Feminino' ? 'Aluna' : 'Aluno';

    return '$tratamento: ${aluno!.nome}\n'
        'Curso: ${aluno!.curso}\n'
        'Idade: ${aluno!.idade}';
  }
}