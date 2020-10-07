import 'package:flutter/material.dart';
import 'package:news_app/models/NewsModel.dart';
import 'package:news_app/providers/NewsProvider.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('News App'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
            )
          ],
        ),
        body: FutureBuilder<News>(
          future: getNews(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return Center(child: Text('Error charging data'));
            }
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return getNewsList(snapshot.data);
          },
        ),
      ),
    );
  }

  ListView getNewsList(News data) {
    return ListView.builder(
      itemCount: data.articles.length,
      itemBuilder: (BuildContext context, int index) {
        var objNew = data.articles[index];
        var titulo = "";
        var img = "";
        if(objNew.title == null){
           titulo = "no title";
        }else{
           titulo = objNew.title;
        }
        if(objNew.urlToImage == null){
          img = "assets/loader.gif";
        }else{
          img = objNew.urlToImage;
        }
        return ListTile(
          title: Text(titulo),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(img),
          ),
          onTap: () =>
              {Navigator.pushNamed(context, '/detalle', arguments: objNew)},
        );
      },
    );
  }
}

class DataSearch extends SearchDelegate<String> {

  @override
  List<Widget> buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
     return FutureBuilder<News>(
          future: getSearchedNews(query),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return Center(child: Text('Error charging data'));
            }
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return getNewsList(snapshot.data);
          },
        );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<News>(
          future: getSearchedNews(query),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return Center(child: Text('Error charging data'));
            }
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return getNewsList(snapshot.data);
          },
        );
  }

    ListView getNewsList(News data) {
    return ListView.builder(
      itemCount: data.articles.length,
      itemBuilder: (BuildContext context, int index) {
        var objNew = data.articles[index];
        return ListTile(
          title: Text(objNew.title),
          onTap: () =>
              {Navigator.pushNamed(context, '/detalle', arguments: objNew)},
        );
      },
    );
  }
}
