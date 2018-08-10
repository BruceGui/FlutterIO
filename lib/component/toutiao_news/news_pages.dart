
import 'package:flutter/material.dart';

import 'news_list.dart';

class News extends StatefulWidget {

  const News({ Key key, this.data }) : super(key: key);

  final String data;

  @override
  _NewsPagesState createState() => new _NewsPagesState();
}

class NewsTab {

  String text;
  NewsList newsList;

  NewsTab(this.text, this.newsList);

}

class _NewsPagesState extends State<News> with SingleTickerProviderStateMixin {

  final List<NewsTab> newsTab = <NewsTab>[
    new NewsTab('头条',new NewsList(newsType: 'toutiao')),    //拼音就是参数值
    new NewsTab('社会',new NewsList(newsType: 'shehui')),
    new NewsTab('国内',new NewsList(newsType: 'guonei')),
    new NewsTab('国际',new NewsList(newsType: 'guoji')),
    new NewsTab('娱乐',new NewsList(newsType: 'yule')),
    new NewsTab('体育',new NewsList(newsType: 'tiyu')),
    new NewsTab('军事',new NewsList(newsType: 'junshi')),
    new NewsTab('科技',new NewsList(newsType: 'keji')),
    new NewsTab('财经',new NewsList(newsType: 'caijing')),
    new NewsTab('时尚',new NewsList(newsType: 'shishang')),
  ];

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: newsTab.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(

      appBar: new AppBar(
        backgroundColor: Colors.orangeAccent,
        title: new TabBar(
          controller: _tabController,
          tabs: newsTab.map((NewsTab item) {
            return new Tab(text: item.text ?? 'ERROR',);
          }).toList(),
          indicatorColor: Colors.white,
          isScrollable: true,
        ),
      ),

      body: new TabBarView (
        controller: _tabController,
        children: newsTab.map((item) {
          return item.newsList;
        }).toList(),
      ),

    );
  }

}
