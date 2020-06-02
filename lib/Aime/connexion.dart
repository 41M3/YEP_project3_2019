import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'package:epiflipboard/Aime/pages/signIn.dart';
import 'package:epiflipboard/Aime/services/auth.dart';
import 'package:epiflipboard/Aime/services/is_it_logged.dart';

class homePage extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Color(0xff0000ff),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('EPIFLIPBOARD', style: TextStyle(fontSize: 45)),
                color: Color(0xff0000ff),
              )
            ],
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.bug_report, color: Colors.white, size: 30),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => new IsItLogged(auth: new Auth())));
                }),
          ],
        ));
  }
}
