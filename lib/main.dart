import 'package:flutter/material.dart';
import './homepage.dart';


class Question {
  late String questionText;
  late bool answer;

  Question(String text, bool correctAnswer) {
    questionText = text;
    answer = correctAnswer;
  }
}

void modifierQuestion(Question ancienneQuestion, Question nouvelleQuestion) {
  final index = tableDesQuestions.indexWhere((question) => question.questionText == ancienneQuestion.questionText);

  if (index != -1) {
    tableDesQuestions[index] = nouvelleQuestion;
  }
}

void supprimerQuestion(Question questionAsupprimer) {
  final index = tableDesQuestions.indexWhere((question) => question.questionText == questionAsupprimer.questionText);

  if (index != -1) {
    tableDesQuestions.removeAt(index);
  }
}


List<Question> tableDesQuestions = [
  Question("Le diable de Tasmanie vit dans la jungle du Brésil ?",false),
  Question("La sauterelle saute l'équivalent de 200 fois sa taille ?",true),
  Question("Les pandas hibernent ?",false),
  Question("On trouve des dromadaires en liberté en Australie ?",true),
  Question("Le papillon monarque vole plus de 4000 km ?",true),
  Question("Les gorilles mâles dorment dans les arbres ?",false)
];

String question = "";

void main() {
  runApp(const MyApp());
}
String title = 'Quizz_0';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: title),
    );
  }
}

// ÉDITION PAGE
