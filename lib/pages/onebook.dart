import 'package:flutter/material.dart';
import 'package:flutter_http_post_request/model/bookmodel.dart';

class BookDetails extends StatelessWidget {
  final Book book;
  const BookDetails({Key key, @required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.bookname),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.network(book.screenshot),
          SizedBox(
            height: 10,
          ),
          Text(
            book.bookname,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Author: " + book.author,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Description",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "=>" + book.description,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Tags: #" + book.category,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          ButtonBar(
            children: <Widget>[
              SizedBox(),
              RaisedButton(
                child: Text('Read'),
                onPressed: () {},
              ),
            ],
            buttonMinWidth: 100,
          ),
        ],
      ),
    );
  }
}
