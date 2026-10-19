import '../models/aluno.dart';

class AlunoControllers {
   
   Aluno? aluno;

   void cadastrar(String nome, String curso){
    aluno =Aluno(nome, curso);
  }
  String mostrarAluno(){
    if(aluno== null){
      return "";
    }
    return "aluno:${aluno!.nome}\n"
    "Curso:${aluno!.curso}";
  }
   
  }