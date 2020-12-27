import 'package:flutter/material.dart';
import 'package:flutter_app/pages/sign_in.dart';
import 'package:flutter_app/pages/users_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //initialRoute: '/Users',
      routes: {
        '/' : (context) => SignIn(),
        '/Users': (context) => UserList(),
      },
    );
  }
}