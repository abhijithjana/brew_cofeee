import 'package:cofee/services/brews.dart';
import 'package:flutter/material.dart';

class BrewTile extends StatelessWidget {
  late final BrewList brew;
  BrewTile({required this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 6.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 0.0),
        child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.brown[brew.strength],
            ),
            title: Text(brew.name),
            tileColor: Colors.transparent,
            subtitle: Text('Takes ${brew.sugar} sugars')),
      ),
    );
  }
}
