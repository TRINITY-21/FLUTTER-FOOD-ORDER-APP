import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation, muchDelayedAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    delayedAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 0.1, curve: Curves.fastOutSlowIn)));

    muchDelayedAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 0.1, curve: Curves.fastOutSlowIn)));

    animationController.forward();
  }
    

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return SafeArea(
            child: Scaffold(
              body: Align(
                alignment: Alignment.center,

                child: Container(
                  child: Center(
                  child: ListView(
              children: <Widget>[

                      Transform (
                  transform:
                    Matrix4.translationValues(animation.value * width, 0, 0),
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 23.2, fontWeight: FontWeight.bold),
                        ),

                         Transform (
                  transform:
                    Matrix4.translationValues(animation.value * width, 0, 0),
                child:

                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Username',
                              labelStyle: TextStyle(
                                color: Colors.teal,
                              )),
                        ),
                         ),

                Transform (
                  transform:
                    Matrix4.translationValues(animation.value * width, 0, 0),
                child:
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Colors.teal,
                              )),
                        ),
                ),
                 Transform (
                  transform:
                    Matrix4.translationValues(animation.value * width, 0, 0),
                child:
                        SizedBox(height: 10),
                  ),
                  
                        
              Transform (
                  transform:
                    Matrix4.translationValues(animation.value * width, 0, 0),
                child:
                        RaisedButton(
                            onPressed: () {},
                            color: Colors.blue,
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            )),
              ),
               Transform (
                  transform:
                    Matrix4.translationValues(animation.value * width, 0, 0),
                child:
                        Text('Dont have an account?'),
              ),
               Transform (
                  transform:
                    Matrix4.translationValues(animation.value * width, 0, 0),
                child:
                        SizedBox(height: 10),
              ),

                   Transform (
                  transform:
                    Matrix4.translationValues(animation.value * width, 0, 0),
                child:
                        RaisedButton(
                            onPressed: () {},
                            highlightColor: Colors.white,
                            child: Text(
                              "SignUp",
                              style: TextStyle(color: Colors.teal),
                            )),
                   )

            ]

                 
              
            ),
                       ),
                      )]))),
              )));

                 

       
  }
              );
  }
}
