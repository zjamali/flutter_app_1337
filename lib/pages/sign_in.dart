import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/services/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final spinkit = SpinKitDualRing(
    color: Colors.white,
    size: 50.0,
  );
  var isloading = false;

  Widget Loading(isloading) {
    if (isloading) {
      return spinkit;
    } else {
      return Text(
        'sign in',
        style: TextStyle(
          color: Colors.white,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/LoginUi.png"),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Center(
            child: FlatButton(
              padding: EdgeInsets.only(left: 40, right: 40),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5),
                  side: new BorderSide(width: 1, color: Colors.white)),
              child: Loading(isloading),
              color: Colors.white.withOpacity(0.00),
              onPressed: () async {
                Services.token = await Services.authenticate();
                setState(() {
                  isloading = true;
                });
                /// getToken
                Timer(Duration(seconds: 3), ()
                {
                  Navigator.of(context).pushReplacementNamed('/Users');
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
