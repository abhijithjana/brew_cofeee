import 'package:cofee/model/user.dart';
import 'package:cofee/pages/auth/autentication.dart';
import 'package:cofee/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);

    return user == null ? Authentication() : Home();
  }
}
