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

  // Init the animation config. to the question sentence
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

  // Restart the animation after answer the last question
  @override
  void didUpdateWidget(QuestionText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget._question != widget._question) {
      _fontSizeAnimationController.reset();
      _fontSizeAnimationController.forward();
    }
  }

  @override
  void dispose() {
    _fontSizeAnimationController.dispose();
    super.dispose();
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
