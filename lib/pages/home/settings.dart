import 'package:cofee/model/user.dart';
import 'package:cofee/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cofee/constants/textdecoration.dart';
import 'package:provider/provider.dart';

class Brewsettings extends StatefulWidget {
  const Brewsettings({Key? key}) : super(key: key);

  @override
  State<Brewsettings> createState() => _BrewsettingsState();
}

class _BrewsettingsState extends State<Brewsettings> {
  final _formkey = GlobalKey<FormState>();
  final List<String> sugar = ['1', '2', '3', '4'];

  late String _currentname;
  late String _currentsugar = sugar[0];
  late double _currentstrength = 100.0;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);
    return StreamBuilder<Userdata>(
        stream: Database(uid: user!.uid).userdata,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Form(
              key: _formkey,
              child: Column(
                children: [
                  Text(
                    'Upadte your brew settings',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    initialValue: snapshot.data!.name,
                    decoration:
                        textdecoration.copyWith(label: Text("Enter name")),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter a Name';
                      } else
                        return null;
                    },
                    onChanged: (val) {
                      setState(() {
                        _currentname = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  DropdownButtonFormField<String>(
                    decoration: textdecoration,
                    value: _currentsugar == '0' ? sugar[0] : sugar[0],
                    items: sugar
                        .map((sug) => DropdownMenuItem(
                              value: sug,
                              child: Text("$sug sugars"),
                            ))
                        .toList(),
                    hint: Text('1 sugars'),
                    onChanged: (val) {
                      setState(() {
                        _currentsugar = val.toString();
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Slider(
                      value: _currentstrength,
                      activeColor: Colors.brown[_currentstrength.round()],
                      inactiveColor: Colors.brown[_currentstrength.round()],
                      min: 100.0,
                      max: 900.0,
                      divisions: 8,
                      onChanged: (double val) =>
                          {setState(() => _currentstrength = val)}),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        Database(uid: user.uid).updateuser(_currentsugar,
                            _currentname, _currentstrength.round());
                        Navigator.pop(context);
                        print(_currentname);
                        print(_currentsugar);
                        print(_currentstrength);
                      }
                    },
                    child:
                        Text("update", style: TextStyle(color: Colors.white)),
                    color: Colors.grey,
                  )
                ],
              ),
            );
          } else {
            return Container(
              child: Text('There was an error please restart'),
            );
          }
        });
  }
}
