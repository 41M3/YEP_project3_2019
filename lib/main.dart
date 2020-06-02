import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Aime/connexion.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EPIFLIPBOARD',
      theme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {'/Aime': (_) => homePage(), '/Gaetan': null, '/Charles': null},
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                child: Text('EpiFlipBoard', style: TextStyle(fontSize: 45)),
                color: Color(0xff0000ff),
              )
            ],
          ),
          centerTitle: true,
        ),
        body: ListView(padding: const EdgeInsets.all(10.0), children: <Widget>[
          Container(
            constraints: BoxConstraints.tightFor(width: 100.0, height: 100.0),
          ),
          ListTile(
            title: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/Aime');
                },
                child: Text(
                  "front",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                color: Color(0xff850606),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                )),
          ),
          ListTile(
            title: MaterialButton(
                onPressed: () {},
                child: Text(
                  "API 1",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                color: Color(0xff850606),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                )),
          ),
          ListTile(
            title: MaterialButton(
                onPressed: () {},
                child: Text(
                  "API 2",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                color: Color(0xff850606),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                )),
          )
        ]));
  }
}
