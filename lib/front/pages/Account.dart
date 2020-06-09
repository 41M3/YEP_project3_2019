import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:epiflipboard/back/api/data.dart';
import 'package:epiflipboard/front/models/widgets.dart';
import 'package:epiflipboard/back/models/categorie_model.dart';
import 'package:epiflipboard/front/models/categorie_news.dart';
import 'package:epiflipboard/back/firebase/auth.dart';
import 'package:epiflipboard/back/api/news.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Epi",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
              ),
              Text(
                "FlipBoard",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: <Widget>[
            _showForm(),
          ],
        ));
  }

  Widget _showForm() {
    return new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              displayTextContainer("GESTION DU COMPTE"),
            ],
          ),
        ));
  }

  Widget displayTextContainer(text) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(text, style: new TextStyle(fontSize: 20.0, color: Colors.white)),
        ]));
  }
}
