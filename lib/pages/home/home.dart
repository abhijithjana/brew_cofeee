import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cofee/pages/home/brewlist.dart';
import 'package:cofee/pages/home/settings.dart';
import 'package:cofee/services/auth.dart';
import 'package:cofee/services/database.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cofee/services/brews.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _showbuttompannel() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: Brewsettings(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final Auth _auth = Auth();
    return StreamProvider<List<BrewList>?>.value(
        catchError: (_, __) => null,
        initialData: null,
        value: Database().brews,
        child: MaterialApp(
          home: Scaffold(
              backgroundColor: Colors.brown[100],
              appBar: AppBar(
                backgroundColor: Colors.brown[400],
                title: Text('Home'),
                elevation: 0.0,
                actions: [
                  FlatButton.icon(
                    onPressed: () async {
                      await _auth.signout();
                    },
                    icon: Icon(Icons.person),
                    label: Text("logout"),
                  ),
                  FlatButton.icon(
                      onPressed: () {
                        _showbuttompannel();
                      },
                      icon: Icon(Icons.settings),
                      label: Text("Setting"))
                ],
              ),
              body: Brewlist()),
        ));
  }
}
