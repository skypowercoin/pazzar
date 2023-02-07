import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pazar/models/database_coniction.dart';

import 'original_button.dart';

enum AuthType { login, register }

class AuthForm extends StatefulWidget {
  final AuthType authType;

  AuthForm({Key? key, required this.authType}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '', _password = '', _erorr = '', _repassword = '';

  @override
  Widget build(BuildContext context) {
    var signerrorMessage;
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: Column(
          children: <Widget>[
            SizedBox(
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: Icon(
                    Icons.error_outline,
                    color: Colors.white,
                  ),
                ),
                Text(
                  _erorr,
                  style: TextStyle(fontSize: 18, color: Colors.red),
                )
              ]),
            ),
            TextFormField(
              ///decoration: InputDecoration(
              ///   labelText: 'Enter your email',
              // hintText: 'ex: test@gmail.com',
              //),
              onChanged: (value) {
                _email = value;
              },
              validator: (value) =>
                  value!.isEmpty ? 'You must enter a valid email' : null,
            ),
            SizedBox(height: 5),
            TextFormField(
              ////decoration: InputDecoration(
              ///  labelText: 'Enter your password',
              //),
              obscureText: true,
              onChanged: (value) {
                _password = value;
              },
              validator: (value) => value!.length <= 6
                  ? 'Your password must be larger than 6 characters'
                  : null,
            ),
            SizedBox(height: 15),
            OriginalButton(
              text: widget.authType == AuthType.login ? 'Login' : 'Register',
              color: Colors.lightBlue,
              textColor: Colors.white,
              sidecolor: Colors.black,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  if (widget.authType == AuthType.login) {
                    try {
                      loginuser(_email, _password, context);
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: _email, password: _password);
                      Navigator.of(context).pushReplacementNamed('home');
                    } on FirebaseAuthException catch (e) {
                      setState(() {
                        _erorr = e.code.toString();
                      });

                      print(_erorr);
                    }
                  } else {
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _email, password: _password);
                      Navigator.of(context).pushReplacementNamed('login');
                    } on FirebaseAuthException catch (e) {
                      setState(() {
                        _erorr = e.code.toString();
                      });
                      print(_erorr);
                    }
                  }
//                  print(_email);
//                  print(_password);
                }
              },
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                if (widget.authType == AuthType.login) {
                  Navigator.of(context).pushReplacementNamed('register');
                  print(widget.authType);
                } else {
                  Navigator.of(context).pushReplacementNamed('login');
                }
              },
              child: Text(
                widget.authType == AuthType.login
                    ? 'Don\'t have an account?'
                    : 'Already have an account?',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ),
            SizedBox(height: 0),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('rsetpaswoed');
              },
              child: Text(
                widget.authType == AuthType.login
                    ? 'Don\'t remembr password?'
                    : '',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
