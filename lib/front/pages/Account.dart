import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:epiflipboard/back/api/data.dart';
import 'package:epiflipboard/front/models/widgets.dart';
import 'package:epiflipboard/back/models/categorie_model.dart';
import 'package:epiflipboard/front/models/categorie_news.dart';
import 'package:epiflipboard/back/firebase/auth.dart';
import 'package:epiflipboard/back/api/news.dart';
import 'package:flutter/scheduler.dart';
import 'package:epiflipboard/front/pages/homepage.dart';

class AccountPage extends StatefulWidget {
  AccountPage(
      {Key key, this.auth, this.userId, this.logoutCallback, this.categories});

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;
  List<CategorieModel> categories;

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool _valueBusiness = false;
  bool _valueDivertissement = false;
  bool _valueGeneral = true;
  bool _valueSante = false;
  bool _valueScience = false;
  bool _valueSport = false;
  bool _valueTech = false;

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
              displayTextContainer("user ID : " + widget.userId),
              displayTextContainer("email : " + "***************"),
              displayVoidPadding(null, 200.0, null, null),
              displayTextContainer("Thème des articles"),
              checkBox("Business", Icon(Icons.keyboard_arrow_right), true),
              checkBox("Divertissement", Icon(Icons.keyboard_arrow_right), true),
              checkBox("General", Icon(Icons.keyboard_arrow_right), true),
              checkBox("Santé", Icon(Icons.keyboard_arrow_right), true),
              checkBox("Science", Icon(Icons.keyboard_arrow_right), false),
              checkBox("Sport", Icon(Icons.keyboard_arrow_right), true),
              checkBox("Tech", Icon(Icons.keyboard_arrow_right), true),
            ],
          ),
        ));
  }

  Widget displayVoidPadding(a, b, c, d) {
    return Padding(
        padding: EdgeInsets.fromLTRB(
            a != null ? a : 0.0, b != null ? b : 150.0, c != null ? c : 0.0, d != null ? d : 0.0));
  }

  Widget displayTextContainer(text) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(text, style: new TextStyle(fontSize: 20.0, color: Colors.white)),
        ]));
  }

  Widget checkBox(text, icon, _value) {
    return Center(
      child: CheckboxListTile(
        title: Text(text),
        value: text == "Business"
            ? _valueBusiness
            : text == "Divertissement"
                ? _valueDivertissement
                : text == "General"
                    ? _valueGeneral
                    : text == "Santé"
                        ? _valueSante
                        : text == "Science"
                            ? _valueScience
                            : text == "Sport" ? _valueSport : _valueTech,
        onChanged: (bool newValue) {
          setState(() {
            _valueBusiness = false;
            _valueDivertissement = false;
            _valueGeneral = false;
            _valueSante = false;
            _valueScience = false;
            _valueSport = false;
            _valueTech = false;
            switch (text) {
              case "Business":
                _valueBusiness = newValue;
                break;
              case "Divertissement":
                _valueDivertissement = newValue;
                break;
              case "General":
                _valueGeneral = newValue;
                break;
              case "Santé":
                _valueSante = newValue;
                break;
              case "Science":
                _valueScience = newValue;
                break;
              case "Sport":
                _valueSport = newValue;
                break;
              case "Tech":
                _valueTech = newValue;
                break;
            }
            // _value = newValue;
          });
        },
        secondary: icon,
      ),
    );
  }
}
