import 'package:flutter/material.dart';

/// 详情页
class DetailPage extends StatefulWidget {
  final String title;
  final String url;

  DetailPage({Key key, this.title, this.url}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title}"),
      ),
      body: Container(
        child: Text("${widget.url}"),
      ),
    );
  }
}
