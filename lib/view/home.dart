import 'package:flutter/material.dart';
import 'package:insightify/controller/fetchnews.dart';
import 'package:insightify/model/news_art.dart';
import 'package:insightify/view/widgets/newsContainer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;

  late NewsArt newsArt;

  Future<void> getNews() async{
    newsArt = await fetchNews.FetchNews();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getNews();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: PageController(initialPage: 0),
        scrollDirection: Axis.vertical,

          onPageChanged: (value) {
            setState(() {
              isLoading = true;
            });
            getNews();
          },

          //itemCount: 1,
          itemBuilder: (context,index){

          //getNews();

          //fetchNews.FetchNews();
          return isLoading ? const Center(child: CircularProgressIndicator(),) : NewsContainer(
              imgUrl: newsArt.ImgUrl,
              newsHead: newsArt.NewsHead,
              newsDesc: newsArt.NewsDesc,
              newsCNT: newsArt.NewsCnt,
              newsUrl: newsArt.NewsUrl,
              date: newsArt.Date,
          );

        }
      ),
    );
  }
}
