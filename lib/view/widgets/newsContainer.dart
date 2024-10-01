import 'package:flutter/material.dart';
import 'package:insightify/view/detail_view.dart';

class NewsContainer extends StatefulWidget {

  final String imgUrl;
  final String newsHead;
  final String newsDesc;
  final String newsCNT;
  final String newsUrl;
  final String date;



  const NewsContainer({super.key,
  required this.imgUrl,
    required this.newsHead,
    required this.newsDesc,
    required this.newsCNT,
    required this.newsUrl,
    required this.date
  });

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.square(0),
      child: Container(
        color: Colors.white,
      ),
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: FadeInImage.assetNetwork(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    placeholder: "assets/images/break-news.jpg", image: widget.imgUrl
                ),
              ),


              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20,),
                        Text("Date- ${widget.date}",style: const TextStyle(fontSize: 15),),
                        const SizedBox(height: 10,),
                        Text(widget.newsHead,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                        const SizedBox(height: 10,),
                        Text(widget.newsDesc,style: const TextStyle(fontSize: 16,color: Colors.blueGrey),),
                        const SizedBox(height: 10,),
                        Text(
                          widget.newsCNT != "--" ?
                          widget.newsCNT.length > 100 ? widget.newsCNT.substring(0,100) :
                            "${widget.newsCNT.toString().substring(0,widget.newsCNT.length-15)}...." : widget.newsCNT
                          ,style: const TextStyle(fontSize: 16),),
                        //Spacer(),
                      ],
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(
                              builder: (context)=>DetailView(newsURL: widget.newsUrl)
                              )
                          );
                        },
                        child: const Text("Read More")
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
