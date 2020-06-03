import 'package:flutter/material.dart';
import 'package:epiflipboard/Aime/services/auth.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  /*
  void User() async {
    try {
      String user = await widget.auth.getUserName();
      print(user);
    } catch (e) {}
  }*/

  @override
  Widget build(BuildContext context) {
    //User();

    return new Scaffold(
        appBar: new AppBar(
          title: new Text('EPIFLIPBOARD HOME'),
          actions: <Widget>[
            new FlatButton(
                child: new Text('Logout',
                    style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed: signOut)
          ],
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
          child: Text('EPIFLIPBOARD FRONT TEST', style: TextStyle(fontSize: 45)),
          color: Color(0xff0000ff),
        ));
  }
}
