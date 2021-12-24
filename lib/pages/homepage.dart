import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_http_post_request/model/bookmodel.dart';
import 'package:flutter_http_post_request/pages/onebook.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  Future getUserData() async {
    var response = await http
        .get(Uri.http('API', 'API'));
    var jsonData = jsonDecode(response.body);
    List<Book> books = [];
    for (var u in jsonData) {
      Book book = Book(u["id"], u['bookname'], u['bookfile'], u['screenshot'],
          u['description'], u['author'], u['category']);
      books.add(book);
    }
    print(books.length);
    return books;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              }),
        ],
      ),
      body: Container(
        child: Card(
          child: FutureBuilder(
            future: getUserData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text('Loading...'),
                  ),
                );
              } else {
                return GridView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: snapshot.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            snapshot.data[index].screenshot,
                            height: 75,
                            width: 88,
                          ),
                          Text(snapshot.data[index].bookname),
                          ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                child: Text('View'),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => BookDetails(
                                            book: snapshot.data[index],
                                          )));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
  

// class Book {
//   final int id;
//   final String bookname, bookfile, screenshot, description, author, category;
//   Book(this.id, this.bookname, this.bookfile, this.screenshot, this.description,
//       this.author, this.category);
// }
