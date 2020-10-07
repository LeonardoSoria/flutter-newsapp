import 'package:flutter/material.dart';
import 'package:news_app/models/NewsModel.dart';

class NewsDetail extends StatefulWidget {
  NewsDetail({Key key}) : super(key: key);

  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  @override
  Widget build(BuildContext context) {
    Article objNew = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("New Details"),
      ),
      body: ListView(
        children: <Widget>[
          getImageCard(objNew),
        ],
      ),
    );
  }

  Widget getImageCard(Article objNew) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              objNew.title,
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue
              )),
          ),
          FadeInImage(
            placeholder: AssetImage('assets/loader.gif'),
            image: NetworkImage(objNew.urlToImage)
          ),
          Container(
            child: Text(objNew.description)
          ),
          Container(
            child: Text('Author: ' + objNew.author))
      ],)
    );
  }
}
