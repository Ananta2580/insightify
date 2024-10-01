class NewsArt{

  String ImgUrl;
  String NewsHead;
  String NewsDesc;
  String NewsCnt;
  String NewsUrl;
  String Date;

  NewsArt({
    required this.ImgUrl,
    required this.NewsHead,
    required this.NewsDesc,
    required this.NewsCnt,
    required this.NewsUrl,
    required this.Date,
});

  static NewsArt fromApiToApp(Map<String,dynamic> article){

    return NewsArt(ImgUrl: article["urlToImage"] ?? "https://img.freepik.com/free-vector/breaking-news-concept_23-2148514216.jpg?w=2000",
            NewsHead: article["title"] ?? "--",
            NewsDesc: article["description"] ?? "--",
            NewsCnt: article["content"] ?? "--",
            NewsUrl: article["url"] ?? "https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en",
            Date : article["publishedAt"] ?? "--"
    );

  }


}