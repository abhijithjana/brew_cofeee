import 'package:cofee/model/user.dart';
import 'package:cofee/pages/auth/autentication.dart';
import 'package:cofee/pages/wrapper.dart';
import 'package:cofee/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users?>.value(
      catchError: (_, __) => null,
      initialData: null,
      value: Auth().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
