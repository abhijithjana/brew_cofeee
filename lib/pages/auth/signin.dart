import 'package:cofee/constants/textdecoration.dart';
import 'package:cofee/services/auth.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  final Function toogleview;
  Signin({required this.toogleview});
  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final Auth _auth = Auth();
  final _formvalidator = GlobalKey<FormState>();

  String error = '';
  String _email = "";
  String _password = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.brown[100],
          appBar: AppBar(
            backgroundColor: Colors.brown[400],
            title: Text("Singn in auth"),
            elevation: 0.0,
            actions: [
              FlatButton.icon(
                onPressed: () {
                  widget.toogleview();
                },
                label: Text("Registration"),
                icon: Icon(Icons.person),
              )
            ],
          ),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formvalidator,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: textdecoration.copyWith(hintText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter email';
                      } else
                        return null;
                    },
                    onChanged: (value) {
                      setState(() => {_email = value});
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: textdecoration.copyWith(hintText: 'password'),
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return 'Enter a valid password';
                      } else
                        return null;
                    },
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                      onPressed: () async {
                        if (_formvalidator.currentState!.validate()) {
                          print(_email);
                          print(_password);
                          dynamic result =
                              await _auth.SigninwithemailandPassword(
                                  _email, _password);
                          if (result == null) {
                            setState(() {
                              error = 'Invalid data';
                            });
                          }
                        }
                      },
                      child: Text("sign up")),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
