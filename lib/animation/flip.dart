import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'dart:math';

void main() => runApp(FlipAnimation());

class FlipAnimation extends StatelessWidget {
  const FlipAnimation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Flip(),
    );
  }

}

class Flip extends StatefulWidget {
  Flip({Key key}) : super(key: key);

  @override
  _FlipState createState() => _FlipState();
}

class _FlipState extends State<Flip> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeInOutCirc)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
      ),
      body: AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return Center(
              child: InkWell(
                  onTap: () {
                    _controller.repeat();
                  },
                  child: Container(
                      height: 200.0,
                      width: 200.0,
                      child: Transform(
                        transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.005)
                          ..rotateY(2 * pi * animation.value),
                          alignment: Alignment.center,
                          child:Container(
                            height:100,
                            width:100, 
                            color:Colors.green.withOpacity(0.2),
                            child: RotationTransition(
                              turns: animation,
                              child: Center(
                                child: Text('Flipping',
                                style:TextStyle(
                                  fontSize: 25.0, 
                                  fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            ),
                          ),
                      ),
                      ),
                      );
      
            
          }),
    );
  }
}
