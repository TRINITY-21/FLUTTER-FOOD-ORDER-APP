import 'package:ange/onboarding/Home.dart';
import 'package:ange/ui/registration/model/registerModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() => runApp(
  
  ChangeNotifierProvider(
    create:(context)=> RegisterModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter BroilerPlate",
        home: Home(),
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.tealAccent,
          accentColor: Colors.tealAccent.withOpacity(0.5),
        ),
      ),
  ));


