import 'package:flutter/material.dart';
import 'package:movie_news/repo/model/Result.dart';

class Details extends StatefulWidget {
  final Result result;

  Details(this.result);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Details"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
              widget.result.title,
            ),
            Text(
              widget.result.overview,
            ),
          ],
        ),
      ),
    );
  }
}
