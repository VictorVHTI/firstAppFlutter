import 'package:meta/meta.dart';

class Book {
  const Book({
  required this.title,
  required this.author,
  required this.image,
  });
  
  final String title;
  final String author;
  final String image;
}

const _source = 'assets/books/';
final bookAppBG = '${_source}Bg.png';

final books = const [
  Book(
    title: 'In Search of Lost Time',
    author: 'Marcel Proust',
    image: '${_source}book1.jpg',
  ),
  Book(
    title: 'Ulysses',
    author: 'James Joyce',
    image: '${_source}book2.jpg',
  ),
  Book(
    title: 'Don Quixote',
    author: ' Miguel de Cervantes',
    image: '${_source}book3.jpg',
  ),
  Book(
    title: 'One Hundred Years of Solitude ',
    author: 'Gabriel Garcia Marquez',
    image: '${_source}book4.jpg',
  ),
  Book(
    title: 'The Great Gatsby',
    author: 'F. Scott Fitzgerald',
    image: '${_source}book5.jpg',
  )
];