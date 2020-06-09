import 'package:flutter/material.dart';
import 'package:epiflipboard/front/models/article_view.dart';
import 'package:epiflipboard/front/pages/Account.dart';
import 'package:epiflipboard/front/pages/signIn.dart';
import 'package:epiflipboard/back/firebase/auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Widget MyAppBar(logged, context, auth, loginCallback, logoutCallback, userId, categories) {
  signOut() async {
    try {
      await auth.signOut();
      logoutCallback();
    } catch (e) {
      print(e);
    }
  }

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
        title: "Se connecter ?",
        buttons: [
          DialogButton(
            child: Text(
              "Oui !",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: Colors.red,
          )
        ]).show();
  }

  return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "Epi",
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
          ),
          Text(
            "FlipBoard",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ],
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.account_box, color: Colors.white, size: 30),
            onPressed: () {
              logged
                  ? Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => AccountPage(auth: auth, userId: userId, logoutCallback: logoutCallback, categories: categories,)))
                  // AccountPage(auth, userId, logoutCallback, categories)))
                  : Navigator.pop(context);
              /*SigninPage(
                        auth: auth,
                        loginCallback: loginCallback,
                      );*/
            }),
        new FlatButton(
            child: new Text('Logout',
                style: new TextStyle(fontSize: 17.0, color: Colors.white)),
            onPressed: () {
              logged ? signOut() : Navigator.pop(context);
              /*Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => SigninPage(
                          auth: auth,
                          loginCallback: loginCallback,
                        ))
            );*/
            })
      ],
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      automaticallyImplyLeading: false);
}

class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl;

  NewsTile(
      {this.imgUrl,
      this.desc,
      this.title,
      this.content,
      @required this.posturl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      postUrl: posturl,
                    )));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        imgUrl,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    desc,
                    maxLines: 2,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
