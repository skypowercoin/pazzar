import 'package:flutter/material.dart';
import 'package:pazar/models/original_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RsetPaswordForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RsetPaswordForm();
  }
}

@override
class _RsetPaswordForm extends State<RsetPaswordForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '', _password = '', _erorr = '';

  @override
  Widget build(BuildContext context) {
    var signerrorMessage;
    return Form(
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Column(children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Enter your email',
                  hintText: 'ex: test@gmail.com',
                ),
                onChanged: (value) {
                  _email = value;
                },
                validator: (value) =>
                    value!.isEmpty ? 'You must enter a valid email' : null,
              ),
              SizedBox(
                height: 20,
              ),
              OriginalButton(
                  sidecolor: Colors.black,
                  text: 'send Password Reset link to Email',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        await FirebaseAuth.instance
                            .sendPasswordResetEmail(email: _email);
                        Navigator.of(context).pushReplacementNamed('login');
                      } on FirebaseException catch (e) {
                        setState(() {
                          _erorr = e.code.toString();
                        });
                      }
                    }
                  },
                  color: Colors.blue.shade900,
                  textColor: Colors.white),
              const SizedBox(
                height: 20.0,
              ),
              OriginalButton(
                sidecolor: Colors.black,
                text: "Back",
                color: Colors.orange.shade900,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('login');
                },
              )
            ])));
  }
}
