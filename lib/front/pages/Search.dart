import 'package:epiflipboard/back/models/categorie_model.dart';
import 'package:epiflipboard/front/models/search_news.dart';
import 'package:flutter/material.dart';

import 'package:epiflipboard/front/pages/homepage.dart';

String input;

class searchPage extends StatelessWidget {
  searchPage({Key key, this.categories});

  final TextEditingController searchController = TextEditingController();
  List<CategorieModel> categories;
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
        ),
        body: Stack(
          children: <Widget>[
            _showLmt(context),
          ],
        ));
  }

  Widget _showLmt(context) {
    return new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          key: _formKey,
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              displayVoidPadding(null, 100.0, null, null),
              showSearchForm(),
              showSearchButton(context),
              displayVoidPadding(null, 40.0, null, null),
              displayTextContainer("Recherche par Catégorie"),
              displayVoidPadding(null, 30.0, null, null),
              categoryContainer(categories),
            ],
          ),
        ));
  }

  Widget showSearchForm() {
    return ListTile(
      title: TextFormField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: "Ex : Doctor who, Tardis, ...",
          labelText: "Entrez une recherche",
          contentPadding: const EdgeInsets.fromLTRB(15.0, 20.0, 10.0, 25.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }

  Widget showSearchButton(context) {
    return ListTile(
      title: RaisedButton(
        elevation: 5.0,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        color: Colors.red,
        child: new Text('Rechercher',
            style: new TextStyle(fontSize: 20.0, color: Colors.white)),
        onPressed: () {
          input = searchController.text;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SearchNews(
                        newsSearch: input.toLowerCase(),
                      )));
        },
      ),
    );
  }

  Widget displayVoidPadding(a, b, c, d) {
    return Padding(
        padding: EdgeInsets.fromLTRB(a != null ? a : 0.0, b != null ? b : 150.0,
            c != null ? c : 0.0, d != null ? d : 0.0));
  }

  Widget displayTextContainer(text) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(text, style: new TextStyle(fontSize: 20.0, color: Colors.white)),
        ]));
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
}
