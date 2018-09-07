import 'package:flutter/material.dart';
import 'package:flutter_app/model/book.dart';
import 'package:flutter_app/util/dbhelper.dart';


class BookList extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return BookListState();
  }

}

class BookListState extends State<BookList>{

  DbHelper helper = DbHelper();
  List<Book> books;
  int count = 0 ;

  @override
  Widget build(BuildContext context) {
    if(books == null){
      books = List<Book>();
      getData();
    }
    return Scaffold(
      appBar: AppBar(title: Text('Books')),
      body: bookLIstItems(),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: "Add new book",
        child: new Icon(Icons.add),
      ),
    );
  }

  ListView bookLIstItems(){
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position){
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.redAccent,
              child: Text(this.books[position].id.toString() ),
            ),
            title: Text(this.books[position].title),
            subtitle: Text(this.books[position].date),
            onTap: () {
              debugPrint("tabpped " +this.books[position].id.toString());
            },
          ),
        );
      },
    );
  }

  void getData(){
    final dbFuture = helper.initalizeDb();
    dbFuture.then((result) {
      final bookFuture = helper.getBooks();
      bookFuture.then((result){
        List<Book> bookList = List<Book>();
        count = result.length;
        for(int i = 0; i < count; i++){
         bookList.add((Book.fromObject(result[i])));
        }
        setState(() {
          count = count;
          books = bookList;
        });
      });
    });
  }

}