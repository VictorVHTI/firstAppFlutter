import 'package:example_flutter/src/screens/books/book.dart';
import 'package:flutter/material.dart';

class BooksConcept extends StatefulWidget {

  @override
  _BooksConceptState createState() => _BooksConceptState();
}

class _BooksConceptState extends State<BooksConcept> {
  late final _controller = PageController();
  final _notifierScroll = ValueNotifier(0.0);
  void _listener() {
    _notifierScroll.value = _controller.page!;
  }

  @override
  void initState() {
    _controller.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final bookHeight = _size.height * 0.45;
    final bookWidth = _size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 0,
        title: Text('Bookio test', style: TextStyle(color: Colors.black),),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Stack(children: [
        Positioned.fill(
          child: Image.asset(bookAppBG, fit: BoxFit.fill,),
        ), 
        ValueListenableBuilder<double>(
          valueListenable: _notifierScroll,
          builder: (context, value, _) {
            return PageView.builder(
              controller: _controller,
              itemCount: books.length,
              itemBuilder: (BuildContext context, int index) {
                final book = books[index];
                final percentage = index - value;
                if (index == 1) {
                  print(percentage);
                }
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Transform(
                          alignment: Alignment.centerLeft,
                          transform: Matrix.identity(),
                          child: Image.asset(
                            book.image, 
                            fit: BoxFit.cover,
                            height: bookHeight,
                            width: bookWidth,
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      Text(
                        book.title,
                        style: TextStyle(color: Colors.grey, fontSize: 30),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'by: ${book.author}',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                    ],
                  ),
                );
              },);
          }
        )
      ],)
    );
  }
}