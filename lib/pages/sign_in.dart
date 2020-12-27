import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/services/services.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/LoginUi.png"),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.only(top: 600),
          child: Center(
            child: FlatButton(
              padding: EdgeInsets.only(left: 40,right: 40),
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5), side: new BorderSide( width: 1,color: Colors.white)),
              child: Text(
                'sign in',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.white.withOpacity(0.00),
              onPressed: () async{
                Services.token = await Services.authenticate(); /// getToken
                Navigator.of(context).pushReplacementNamed('/Users');
              },
            ),
          ),
        ),
      ),
    );
  }
}
