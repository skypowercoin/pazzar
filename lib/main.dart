import 'package:flutter/material.dart';
import 'package:pazar/screens/auth_screen.dart';
import 'package:pazar/screens/home/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'models/auth_form.dart';
import 'models/original_button.dart';
import 'screens/rest_paswoord_scren.dart';
////adb tcpip 5555
///adb connect xxx.xxx.xxx.xxx:5555 // IP address of your device xxx.xxx.xxx.xxx:5555

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TURKMART',
          theme: ThemeData(
            textTheme:
                GoogleFonts.almaraiTextTheme(Theme.of(context).textTheme),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('ar', 'AE'), // English, no country code
            Locale('ar', 'SY'), // Spanish, no country code
          ],
          locale: const Locale('ar', 'AE'),
          home: Scaffold(
            body: AuthTypeSelector(),
          ),
          routes: {
            'home': (context) => HomeScreen(),
            'login': (context) => AuthScreen(authType: AuthType.login),
            'register': (context) => AuthScreen(authType: AuthType.register),
            'rsetpaswoed': (context) => rsetpaswoed(),
          });
    });
  }
}

class AuthTypeSelector extends StatelessWidget {
  // Navigates to a new page
  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context) /*!*/ .push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: size.height * 0.60,
              child:
                  Image.asset('assets/images/first.png', fit: BoxFit.fitWidth),
            ),
            Center(
              child: SizedBox(
                height: size.height * 0.10,
                width: size.width * 0.68,
                child: OriginalButton(
                    textColor: Colors.white,
                    sidecolor: Colors.black,
                    color: Colors.orange.shade900,
                    text: 'GO TO STARTED',
                    onPressed: () async {
                      Navigator.of(context).pushReplacementNamed('home');
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
