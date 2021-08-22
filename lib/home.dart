import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './models/newsInfo.dart';
import './api_manager/api_manager.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Welcome> _newsModel;
  @override
  void initState() {
    _newsModel = API_Manager().getWelcome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return CupertinoPageScaffold(
    //   child: Container(
    //     child: FutureBuilder<Welcome>(
    //       future: _newsModel,
    //       builder: (context, snapshot) {
    //         if (snapshot.hasData) {
    //           return ListView.builder(
    //               itemCount: snapshot.data.articles.length,
    //               itemBuilder: (context, index) {
    //                 var article = snapshot.data.articles[index];
    //                 var formattedTime = DateFormat('dd MMM - HH:mm')
    //                     .format(article.publishedAt);
    //                 return Container(
    //                   height: 100,
    //                   margin: const EdgeInsets.all(8),
    //                   child: Row(
    //                     children: <Widget>[
    //                       Card(
    //                         clipBehavior: Clip.antiAlias,
    //                         shape: RoundedRectangleBorder(
    //                           borderRadius: BorderRadius.circular(24),
    //                         ),
    //                         child: AspectRatio(
    //                             aspectRatio: 1,
    //                             child: Image.network(
    //                               article.urlToImage,
    //                               fit: BoxFit.cover,
    //                             )),
    //                       ),
    //                       SizedBox(width: 16),
    //                       Flexible(
    //                         child: Column(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: <Widget>[
    //                             Text(formattedTime),
    //                             Text(
    //                               article.title,
    //                               overflow: TextOverflow.ellipsis,
    //                               style: TextStyle(
    //                                   fontSize: 20,
    //                                   fontWeight: FontWeight.bold),
    //                             ),
    //                             Text(
    //                               article.description,
    //                               maxLines: 2,
    //                               overflow: TextOverflow.ellipsis,
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 );
    //               });
    //         } else
    //           return Center(child: CircularProgressIndicator());
    //       },
    //     ),
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Container(
        child: FutureBuilder<Welcome>(
          future: _newsModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.articles.length,
                  itemBuilder: (context, index) {
                    var article = snapshot.data.articles[index];
                    var formattedTime = DateFormat('dd MMM - HH:mm')
                        .format(article.publishedAt);
                    return Container(
                      height: 100,
                      margin: const EdgeInsets.all(8),
                      child: Row(
                        children: <Widget>[
                          Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  article.urlToImage,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          SizedBox(width: 16),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(formattedTime),
                                Text(
                                  article.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  article.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            } else
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
