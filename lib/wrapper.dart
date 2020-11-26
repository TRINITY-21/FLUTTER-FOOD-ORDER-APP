import 'package:ange/onboarding/Home.dart';
import 'package:ange/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Wrapper extends StatefulWidget {
  Wrapper({Key key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  // get token

  FlutterSecureStorage storage = FlutterSecureStorage();

  // if exists

  @override
  Widget build(BuildContext context) {
    final isAuth = storage.read(key: 'token');
    
   print("isAuth $isAuth");

    if (isAuth != null) {
      return HomePage();
    } else {
      return Home();
    }
  }
}

