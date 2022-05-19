import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pazar/screens/home/restpaswrdform.dart';
import 'package:pazar/models/original_button.dart';

import 'package:pazar/models/auth_form.dart';

class rsetpaswoed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.618,
                  decoration: BoxDecoration(
                    color: Colors.cyan[900],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(500, 200),
                      bottomLeft: Radius.circular(70),
                      bottomRight: Radius.elliptical(200, 500),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 220,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            RsetPaswordForm()
          ],
        ),
      ),
    );
  }
}
