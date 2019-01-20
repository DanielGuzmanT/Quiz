import 'package:flutter/material.dart';
import 'package:quizz/UI/answer_button.dart';
import 'package:quizz/UI/correct_wrong_overlay.dart';
import 'package:quizz/UI/question_text.dart';
import 'package:quizz/utils/Question.dart';
import 'package:quizz/utils/Quiz.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Quiz quiz = new Quiz([
    new Question("Flutter is amazing", true),
    new Question("Winter is coming", true),
    new Question("It's dark and cold tonight", false),
    new Question("You'll prove your examns", false),
    new Question("Tomorrow is Saturday", false),
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, () => print("True men")),
            new QuestionText("Pizza is awful", 2),
            new AnswerButton(false, () => print("False men")),
          ],
        ),
        new CorrectWrongOverlay(false),
      ],
    );
  }
}
