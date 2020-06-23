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
import 'package:rflutter_alert/rflutter_alert.dart';

class AccountPage extends StatefulWidget {
  AccountPage(
      {Key key,
      this.auth,
      this.userId,
      this.userEmail,
      this.logoutCallback,
      this.categories,
      this.valueGeneral});

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;
  final String userEmail;
  List<CategorieModel> categories;
  final bool valueGeneral;

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final _formKey = new GlobalKey<FormState>();
  String _errorMessage;
  String _password;

  bool _valueBusiness = false;
  bool _valueDivertissement = false;
  bool _valueGeneral = true;
  bool _valueSante = false;
  bool _valueScience = false;
  bool _valueSport = false;
  bool _valueTech = false;

  var alertStyle = AlertStyle(
    isCloseButton: false,
    descStyle: TextStyle(fontWeight: FontWeight.bold),
    animationDuration: Duration(milliseconds: 200),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
      side: BorderSide(color: Color(0xff303030)),
    ),
    titleStyle: TextStyle(
      color: Colors.white,
    ),
  );

  void connectedAlert(context) {
    Alert(
        style: alertStyle,
        context: context,
        title: "Mot de passe changé avec succès",
        buttons: [
          DialogButton(
            child: Text(
              "Cool !",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Colors.red,
          )
        ]).show();
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    print(_password);
    setState(() {
      _errorMessage = "";
    });
    if (validateAndSave()) {
      try {
        await widget.auth.changePassword(_password);
        print('YEAAAAAH');
        Navigator.pop(context);
        connectedAlert(context);
      } catch (e) {
        print('Error: $e');
        setState(() {
          _errorMessage = e.message;
          _formKey.currentState.reset();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.valueGeneral);
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
    print(widget.valueGeneral);
    print(widget.userEmail);
    return new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          key: _formKey,
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              displayTitreContainer("INFORMATIONS DU COMPTE"),
              displayTextContainer("Email : " + widget.userEmail),
              displayTextContainer("UID : " + widget.userId),
              displayVoidPadding(null, 60.0, null, null),
              displayTitreContainer("CHANGER DE MOT DE PASSE"),
              changePasswordInput(),
              changePasswordButton(),
              showErrorMessage(),
       /*       displayVoidPadding(null, 100.0, null, null),
              displayTextContainer("Catégories favorites"),
              checkBox("Business", Icon(Icons.keyboard_arrow_right), true),
              checkBox("Entertainment", Icon(Icons.keyboard_arrow_right), true),
              checkBox("General", Icon(Icons.keyboard_arrow_right), true),
              checkBox("Health", Icon(Icons.keyboard_arrow_right), true),
              checkBox("Science", Icon(Icons.keyboard_arrow_right), false),
              checkBox("Sports", Icon(Icons.keyboard_arrow_right), true),
              checkBox("Technology", Icon(Icons.keyboard_arrow_right), true),*/
            ],
          ),
        ));
  }

  Widget displayVoidPadding(a, b, c, d) {
    return Padding(
        padding: EdgeInsets.fromLTRB(a != null ? a : 0.0, b != null ? b : 150.0,
            c != null ? c : 0.0, d != null ? d : 0.0));
  }

  Widget displayTitreContainer(text) {
    var _screenWidth = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
        child:
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(text,
              style: new TextStyle(
                fontSize: 25.0,
                color: Colors.black,
              )),
        ]));
  }

  Widget displayTextContainer(text) {
    var _screenWidth = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(text,
              style: new TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              )),
        ]));
  }

  Widget changePasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Nouveau mot de passe',
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty
            ? 'Le nouveau mot de passe ne peut pas être vide !'
            : value.trim().length < 8
                ? 'Le nouveau mot de passe doit contenir plus de 8 charactères !'
                : value.trim().length > 100
                    ? "Le nouveau mot de passe doit contenir moins de 100 charactères !"
                    : null,
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  Widget changePasswordButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: SizedBox(
          height: 40.0,
          child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.red,
            child: new Text('Changer de mot de passe',
                style: new TextStyle(fontSize: 20.0, color: Colors.white)),
            onPressed: validateAndSubmit,
          ),
        ));
  }

  Widget categoryContainer(categories) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 70,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(
              categoryName: categories[index].categorieName,
            );
          }),
    );
  }

  Widget checkBox(text, icon, _value) {
    return Center(
      child: CheckboxListTile(
        title: Text(text),
        value: text == "Business"
            ? _valueBusiness
            : text == "Entertainment"
                ? _valueDivertissement
                : text == "General"
                    ? _valueGeneral
                    : text == "Health"
                        ? _valueSante
                        : text == "Science"
                            ? _valueScience
                            : text == "Sports" ? _valueSport : _valueTech,
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
              case "Entertainment":
                _valueDivertissement = newValue;
                break;
              case "General":
                _valueGeneral = newValue;
                break;
              case "Health":
                _valueSante = newValue;
                break;
              case "Science":
                _valueScience = newValue;
                break;
              case "Sports":
                _valueSport = newValue;
                break;
              case "Technology":
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

  Widget showErrorMessage() {
    if (_errorMessage != null && _errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }
}
