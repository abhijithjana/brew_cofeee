import 'package:cofee/model/user.dart';
import 'package:cofee/pages/home/brewlist.dart';
import 'package:cofee/services/brews.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final uid;
  Database({this.uid});
  final CollectionReference brewcollection =
      FirebaseFirestore.instance.collection('brew');
  Future updateuser(String sugar, String name, int strong) async {
    return await brewcollection
        .doc(uid)
        .set({'sugar': sugar, 'name': name, 'strong': strong});
  }
//in the new flutter update, we don't need to add .data()

//I got this error and after removing .data() it was solved.
  List<BrewList> _brewlistfromsnap(QuerySnapshot snapshot) {
    return snapshot.docs.map((document) {
      return BrewList(
          name: document['name'] ?? '',
          sugar: document['sugar'] ?? '',
          strength: document['strong'] ?? 0);
    }).toList();
  }

  Userdata _userdatafromsnap(DocumentSnapshot snapshot) {
    return Userdata(
        uid: uid,
        name: snapshot['name'],
        strength: snapshot['strong'],
        sugar: snapshot['sugar']);
  }

  Stream<List<BrewList>> get brews {
    return brewcollection.snapshots().map(_brewlistfromsnap);
  }

  Stream<Userdata> get userdata {
    return brewcollection.doc(uid).snapshots().map(_userdatafromsnap);
  }
}
