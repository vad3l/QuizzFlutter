class Question {
  late String questionText;
  late bool answer;

  Question(String text, bool correctAnswer) {
    questionText = text;
    answer = correctAnswer;
  }

  factory Question.fromJson(Map<String, dynamic> json) {
    print(json.toString());

    bool val = json['reponse'] == "vrai" ? true : false;
    return Question(
      json['question'] as String,
      val as bool,
    );
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
];
