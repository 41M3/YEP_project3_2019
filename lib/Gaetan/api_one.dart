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
      });
    }
  }
}