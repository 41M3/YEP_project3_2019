import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsApi {
  
  List<Article> news  = [];

  Future<void> getNews() async{

    String url = "http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=604614deb88f4ea981963e4139f50084";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if (element['urlToImage'] != null && element['description'] != null){
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
        print(element['title']);
        print("\n");
      });
    }
  }
}

/*
class NewsCategory {
  List<Article> news  = [];

  Future<void> getNewsForCategory(String category) async{

    String url = "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=604614deb88f4ea981963e4139f50084";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
          list = news.news;
          list[0].urlToImage;
        }
      });
    }
  }
}*/

class Article {
  String title;
  String author;
  String description;
  String urlToImage;
  DateTime publshedAt;
  String content;
  String articleUrl;

  Article({this.title,this.description,this.author,this.content,this.publshedAt,
    this.urlToImage, this.articleUrl});
}