import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget {
  final String _question;
  final int _questionNumber;

  QuestionText(this._question, this._questionNumber);

  @override
  State createState() => new _QuestionTextState();
}

class _QuestionTextState extends State<QuestionText>
    with SingleTickerProviderStateMixin {
  Animation<double> _fontSizeAnimation;
  AnimationController _fontSizeAnimationController;

  @override
  void initState() {
    super.initState();

    _fontSizeAnimationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 500),
    );

    _fontSizeAnimation = new CurvedAnimation(
      parent: _fontSizeAnimationController,
      curve: Curves.bounceOut,
    );

    _fontSizeAnimation.addListener(() => this.setState(() => {}));
    _fontSizeAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: new Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: new Center(
          child: new Text(
            "Statement ${widget._questionNumber}: ${widget._question}",
            style: TextStyle(fontSize: _fontSizeAnimation.value * 15),
          ),
        ),
      ),
    );
  }
}
