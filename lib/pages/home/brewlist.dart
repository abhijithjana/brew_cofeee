import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:cofee/services/database.dart';
import 'package:cofee/services/brews.dart';
import 'package:cofee/model/brewtile.dart';

class Brewlist extends StatelessWidget {
  const Brewlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brew = Provider.of<List<BrewList>?>(context) ?? [];

    return brew != null
        ? ListView.builder(
            itemCount: brew.length,
            itemBuilder: (context, index) {
              return BrewTile(brew: brew[index]);
            })
        : Container();
  }
}
