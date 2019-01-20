import 'package:flutter/material.dart';
import 'package:quizz/pages/landing_page.dart';

class ScorePage extends StatelessWidget {
  final int _score;
  final int _totalQuestions;

  ScorePage(this._score, this._totalQuestions);

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blueAccent,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            "Your score: ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          new Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
          new Text(
            "$_score / $_totalQuestions",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
          ),
          new IconButton(
            icon: Icon(Icons.arrow_right),
            color: Colors.white,
            iconSize: 70.0,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new LandingPage()),
                  (Route route) => route == null,
                ),
          ),
        ],
      ),
    );
  }
}
