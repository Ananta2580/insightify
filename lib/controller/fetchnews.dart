import 'dart:math';

import 'package:http/http.dart';
import 'dart:convert';

import 'package:insightify/model/news_art.dart';


class fetchNews{

  static List sourceId =[

    "abc-news",

    "bbc-news",
    "bbc-sport",

    "business-insider",

    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",

    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",

    "medical-news-today",

    "national-geographic",

    "news24",
    "new-scientist",

    "new-york-magazine",
    "next-big-future",

    "techcrunch",
    "techradar",

    "the-hindu",

    "the-wall-street-journal",

    "the-washington-times",
    "time",
    "usa-today",

  ];

  static Future<NewsArt> FetchNews() async{

    final random = Random();
    var source = sourceId[random.nextInt(sourceId.length)];
    print(source);

    Response response= await get(Uri.parse("https://newsapi.org/v2/top-headlines?sources=$source&apiKey=1f1ba136004b4dc69d9b19eb1bceefe7"));

    Map bodyData = jsonDecode(response.body);

    List articles = bodyData["articles"];

    final newrandom = Random();
    var myArticle = articles[newrandom.nextInt(articles.length)];

    print(myArticle);

    return NewsArt.fromApiToApp(myArticle);

  }
}