import 'package:ange/ui/registration/model/registerModel.dart';
import 'package:ange/ui/registration/signIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  @override
  Widget build(BuildContext context) {
    // Provider to recieve data
    final user = Provider.of<RegisterModel>(context);

    return Scaffold(
      backgroundColor: Colors.teal.withOpacity(1),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                topLeft: Radius.circular(100))),
        child: ListView(children: [
          SizedBox(height: 20),
          Image(
            image: AssetImage(
              "assets/19.jpg",
            ),
            width: 100,
            height: 150,
          ),
          // Padding(
          //   padding: EdgeInsets.only(left: 130.0, right: 0.0, top:20.0),
          //   child: Text(
          //     "Company Icon",
          //     style:
          //         GoogleFonts.notoSans(fontWeight: FontWeight.w800, fontSize: 17),
          //   ),
          // ),

          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 130.0, right: 0.0, top: 20.0),
            child: Text(
              "REGISTER",
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w800, fontSize: 27),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                    offset: Offset(0.0, 1.0),
                  ),
                ],
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: TextFormField(
                onChanged: (value) {
                  user.changeName(value);
                },
                decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.red),
                  errorText: user.username.error,
                  hintText: "Username",
                  hintStyle: GoogleFonts.notoSans(
                      fontWeight: FontWeight.w300, fontSize: 14),
                  prefixIcon:
                      Icon(Icons.person, color: Colors.teal.withOpacity(0.5)),
                  border: InputBorder.none,
                  fillColor: Colors.grey.withOpacity(0.5),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                    offset: Offset(0.0, 1.0),
                  ),
                ],
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: TextFormField(
                onChanged: (value) {
                  user.changeEmail(value);
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  errorText: user.email.error,
                  errorStyle: TextStyle(color: Colors.red),
                  hintText: "Email",
                  hintStyle: GoogleFonts.notoSans(
                      fontWeight: FontWeight.w300, fontSize: 14),
                  prefixIcon:
                      Icon(Icons.email, color: Colors.teal.withOpacity(0.5)),
                  border: InputBorder.none,
                  fillColor: Colors.grey.withOpacity(0.5),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                    offset: Offset(0.0, 1.0),
                  ),
                ],
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: TextFormField(
                onChanged: (value) {
                  user.changePassword(value);
                },
                //keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  errorText: user.password.error,
                  errorStyle: TextStyle(color: Colors.red),
                  hintText: "Password",
                  hintStyle: GoogleFonts.notoSans(
                      fontWeight: FontWeight.w300, fontSize: 14),
                  prefixIcon:
                      Icon(Icons.lock, color: Colors.teal.withOpacity(0.5)),
                  border: InputBorder.none,
                  fillColor: Colors.grey.withOpacity(0.5),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 100.0, right: 100.0),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(),
              child: !user.isValid ? null : RaisedButton(
                onPressed: () {
                  
                  user.saveInfo();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                },
                color: Color(0xFFFE7D6A).withOpacity(0.3),
                child: Text("Register", style: TextStyle(fontSize: 20)),
                textColor: Colors.white,
              ),
            ),
          ),

          Divider(
            height: 10,
            thickness: 1,
            indent: 30,
            endIndent: 30,
          ),

          Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 0.0),
            child: SignInButton(
              Buttons.Google,
              text: "Sign up with Google",
              onPressed: () {},
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 50.0, right: 50.0, top: 0.0),
            child: SignInButton(
              Buttons.Facebook,
              text: "Sign up with Facebook",
              onPressed: () {},
            ),
          ),
          // with custom text

          Padding(
            padding: const EdgeInsets.only(left: 300.0, top: 30),
            child: Text(
              "Designed by Trinity",
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                  textStyle: TextStyle(
                    color: Colors.white,
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}
