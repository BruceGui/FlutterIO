
import 'package:flutter/material.dart';

import 'dart:convert';
import 'dart:async';
import 'dart:io';

class NewsList extends StatefulWidget {

  final String newsType;

  NewsList({Key key, this.newsType}) : super(key: key);

  _NewsListState createState() => new _NewsListState();
}

class _NewsListState extends State<NewsList> {

  final String _url = 'http://v.juhe.cn/toutiao/index?';
  List data;

  Future<String> get(String category) async {

    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(Uri.parse('${_url}type=$category&key=3a86f36bd3ecac8a51135ded5eebe862'));
    var response = await request.close();

    return await response.transform(utf8.decoder).join();
  }

  Future<Null> loadData() async {
    await get(widget.newsType);
    if (!mounted) return;

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new RefreshIndicator(

      child: new FutureBuilder(
        future: get(widget.newsType),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return new Center(
                child: new Card(
                  child: new Text('loading...'),
                ),
              );

            default:
              if (snapshot.hasError) {
                return new Text('Error: ${snapshot.error}}');
              } else {
                return createListView(context, snapshot);
              }
          }
        },
      ),

      onRefresh: loadData,

    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {

    List values;
    values = jsonDecode(snapshot.data)['result'] != null ?
        jsonDecode(snapshot.data)['result']['data'] : [''];

    switch (values.length) {
      
      case 1:
        return new Center(
          child: new Card(
            child: new Text(jsonDecode(snapshot.data['reason'])),
          ),
        );
      default:
        return new ListView.builder(

          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16.0),

          itemCount: values == null ? 0 : values.length,
          itemBuilder: (context, i) {
            return _newsRow(values[i]);
          },

        );
      
    }

  }

  Widget _newsRow(newsInfo) {

    return new Card(

      child: new Column(
        children: <Widget>[
          new Container(
            child: new ListTile(
              title: new Text(newsInfo['title'], textScaleFactor: 1.5,),
            ),

            margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
          ),

          _generateItem(newsInfo),

          new Container(
            padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 25.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Expanded(
                  child: new Text(newsInfo['author_name']),
                ),
                new Expanded(
                  child: new Text(newsInfo['date']),
                ),
              ],
            ),
          ),
        ],
      ),

    );

  }

  _generateItem(Map newsInfo) {
    if (newsInfo['thumbnail_pic_s'] != null &&
        newsInfo['thumbnail_pic_s02'] != null &&
        newsInfo['thumbnail_pic_s03'] != null ) {
      return _generateThreePicItem(newsInfo);
    } else {
      return _generateOnePicItem(newsInfo);
    }
  }


  _generateOnePicItem(Map newsInfo) {

    return new Row(

      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        new Expanded(
          child: new Container(

            padding: const EdgeInsets.all(3.0),
            child: new SizedBox(
              child: new Image.network(
                newsInfo['thumbnail_pic_s'],
                fit: BoxFit.fitWidth,
              ),
              height: 200.0,

            ),
          ),
        )
      ],

    );

  }

  _generateThreePicItem(Map newsInfo) {

    return new Row(

      children: <Widget>[
        new Expanded(

          child: new Container(
            padding: const EdgeInsets.all(4.0),
            child: new Image.network(newsInfo['thumbnail_pic_s']),
          ),

        ),

        new Expanded(

          child: new Container(
            padding: const EdgeInsets.all(4.0),
            child: new Image.network(newsInfo['thumbnail_pic_s02']),
          ),

        ),

        new Expanded(

          child: new Container(
            padding: const EdgeInsets.all(4.0),
            child: new Image.network(newsInfo['thumbnail_pic_s03']),
          ),

        ),
      ],

    );

  }

}
