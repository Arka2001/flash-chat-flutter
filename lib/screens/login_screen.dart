import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  String email;
  String password;
  final _auth = FirebaseAuth.instance;
  bool _isWaiting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _isWaiting,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,  // this is to ensure that we have all the necessary things available on the keyboard when one presses the Input field for email
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your Email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true, //this value is used to mask the password, or rather the text into the standard password masking format
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your Password'),
              ),
              SizedBox(
                height: 24.0,
              ),
             RoundedButton(
               text: 'Log In',
               color: Colors.lightBlueAccent,
               OnPressed: () async{
                 setState(() {
                   _isWaiting = true;
                 });
                 try {
                   final existingUser = await _auth.signInWithEmailAndPassword(
                       email: email, password: password);
                   if (existingUser != null) {
                     Navigator.pushNamed(context, ChatScreen.id);
                   }
                   setState(() {
                     _isWaiting = false;
                   });
                 }catch(e){
                   print(e);
                 }
               },
             ),
            ],
          ),
        ),
      ),
    );
  }
}
