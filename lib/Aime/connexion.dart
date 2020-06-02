import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

String url;

class homePage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  void resetState() {
    SystemChrome.setPreferredOrientations([
      //DeviceOrientation.landscapeRight,
      //DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    resetState();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff0000ff),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text('EpiAirConsole', style: TextStyle(fontSize: 45)),
              color: Color(0xff0000ff),
            )
          ],
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.bug_report, color: Colors.white, size: 30),
              onPressed: () {}),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          Container(
            constraints: BoxConstraints.tightFor(width: 100.0, height: 100.0),
          ),
          ListTile(
            leading: Image.asset("assets/epiairconsole.png"),
            title: TextFormField(
              cursorColor: Color(0xff850606),
              controller: searchController,
              decoration: InputDecoration(
                  hintText: "Exemple : 192.168.0.27",
                  labelText: "Web ID",
                  labelStyle: new TextStyle(color: Color(0xff0000ff)),
                  contentPadding:
                      const EdgeInsets.fromLTRB(15.0, 20.0, 10.0, 25.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Color(0xff0000ff))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Color(0xff0000ff)))),
            ),
          ),
          Container(
              constraints: BoxConstraints.tightFor(width: 100.0, height: 75.0)),
          Container(
            alignment: Alignment.center,
            constraints: BoxConstraints.tightFor(height: 150.0),
            child: Image.asset("assets/gamepad1.png"),
          ),
          ListTile(
            title: MaterialButton(
                onPressed: () {},
                child: Text(
                  "Gamepad 1",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                color: Color(0xff850606),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                )),
          ),
          Container(
              constraints: BoxConstraints.tightFor(width: 100.0, height: 75.0)),
          Container(
            alignment: Alignment.center,
            constraints: BoxConstraints.tightFor(height: 150.0),
            child: Image.asset("assets/gamepad2.png"),
          ),
          ListTile(
            title: MaterialButton(
                onPressed: () {},
                child: Text(
                  "Gamepad 2",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                color: Color(0xff850606),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                )),
          )
        ],
      ),
    );
  }
}
