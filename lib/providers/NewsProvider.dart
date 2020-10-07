import 'package:http/http.dart' as http;
import 'package:news_app/models/NewsModel.dart';

Future<News> getNews() async {
  var url = 'https://newsapi.org/v2/top-headlines?' +
      'country=us&' +
      'apiKey=99870af83d2344a797a22cff5617f389';

  var response = await http.get(url);
  if (response.statusCode == 200) {
    var newsList = newsFromJson(response.body);

    return newsList;
  }
  throw Exception('Connection Error');
}

Future<News> getSearchedNews(query) async {
  var url = 'https://newsapi.org/v2/top-headlines?' +
      'q=$query&' +
      'country=us&' +
      'apiKey=99870af83d2344a797a22cff5617f389';

  var response = await http.get(url);
  if (response.statusCode == 200) {
    var newsList = newsFromJson(response.body);

    return newsList;
  }
  throw Exception('Connection Error');
}
