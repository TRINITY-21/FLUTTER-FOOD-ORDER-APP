import 'package:flutter/material.dart';
//import 'package:flutter/animation.dart';

void main()=> runApp(Gestures());

class Gestures extends StatelessWidget {
  const Gestures({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:GestureAnimation(),
    );
  }
}


class GestureAnimation extends StatefulWidget {
  GestureAnimation({Key key}) : super(key: key);

  @override
  _GestureAnimationState createState() => _GestureAnimationState();
}

class _GestureAnimationState extends State<GestureAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestures"),centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onLongPress:(){
            print('Clicked!');
          },

          child: Container(
            height:50.0,
            width: 100.0,
            child:Text('Click me'),
          )
        )
      )
    );
  }
}