import 'package:cofee/pages/auth/registration.dart';
import 'package:cofee/pages/auth/signin.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool singnin = true;
  void toogleview() {
    setState(() {
      singnin = !singnin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (singnin)
      return Signin(toogleview: toogleview);
    else
      return Register(toogleview: toogleview);
  }
}
