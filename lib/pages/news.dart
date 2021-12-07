import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:news/controllers/news_controller.dart';
import 'package:news/models/news_model.dart';

import 'detail.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends StateMVC<News> {
  _NewsState() : super(NewsController()) {
    con = controller as NewsController;
  }
  late NewsController con;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: StatefulBuilder(builder: (context, setNewState) {
      return Container(
        color: Colors.white,
        child: FutureBuilder<List<NewsList>>(
            future: con.getdata(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());

              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Detail(
                                        url: snapshot.data![index].url,
                                      )),
                            );
                          },
                          child: Card(
                            child: Column(
                              children: [
                                Image.network(
                                    '${snapshot.data![index].urlToImage}'),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    '${snapshot.data![index].title}',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  });
            }),
      );
    }));
  }
}
