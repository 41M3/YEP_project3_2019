import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:epiflipboard/Gaetan/news_api.dart';


String apiKey = "604614deb88f4ea981963e4139f50084";

class News_Getter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _News_Getter();
}

class _News_Getter extends State<News_Getter> {

  bool _loading;
  var newslist;

  void getNews() async {
    NewsApi news = NewsApi();
    await news.getNews();
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('EPIFLIPBOARD API'),
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
          child: Text('EPIFLIPBOARD API TEST', style: TextStyle(fontSize: 45)),
          color: Color(0xff0000ff),
        ));
  }
}