import 'package:flutter/material.dart';
import 'package:quizz/UI/answer_button.dart';
import 'package:quizz/UI/correct_wrong_overlay.dart';
import 'package:quizz/UI/question_text.dart';
import 'package:quizz/pages/score_page.dart';
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

  Question currentQuestion;
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible;

  @override
  void initState() {
    super.initState();
    chargeQuestion();
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldBeVisible = true;
    });
  }

  void chargeQuestion() {
    // in case that there aren't more questions to answer, it'll show the score
    if (quiz.length == questionNumber) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  new ScorePage(quiz.score, quiz.length)),
          (Route route) => route == null);

      return;
    }

    // more questions to answer
    overlayShouldBeVisible = false;
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)),
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () => handleAnswer(false)),
          ],
        ),
        overlayShouldBeVisible
            ? new CorrectWrongOverlay(
                isCorrect,
                () => this.setState(() => chargeQuestion()),
              )
            : new Container(),
      ],
    );
  }
}
