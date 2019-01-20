import 'package:flutter/material.dart';
import 'dart:math' show pi;

class CorrectWrongOverlay extends StatefulWidget {
  final bool _isCorrect;
  final VoidCallback _onTap;

  CorrectWrongOverlay(this._isCorrect, this._onTap);

  @override
  State createState() => new _CorrectWrongOverlayState();
}

class _CorrectWrongOverlayState extends State<CorrectWrongOverlay>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();

    _iconAnimationController = new AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.elasticOut,
    );

    _iconAnimation.addListener(() => this.setState(() => {}));
    _iconAnimationController.forward();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => widget._onTap(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: new Transform.rotate(
                angle: _iconAnimation.value * 2 * pi,
                child: new Icon(
                  widget._isCorrect ? Icons.done : Icons.close,
                  size: _iconAnimation.value * 80.0,
                ),
              ),
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
            new Padding(padding: EdgeInsets.only(bottom: 10.0)),
            new Text(
              widget._isCorrect ? "Correct!" : "Wrong!",
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            ),
          ],
        ),
      ),
    );
  }
}
