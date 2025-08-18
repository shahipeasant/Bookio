import 'package:get/get.dart';

class Book{

  String name;
  String author;
  String description;
  String genre;
  String location;
  var isWishlisted = false.obs;

  Book({
    required this.name,
    required this.author,
    required this.description,
    required this.genre,
    required this.location,
    required this.isWishlisted,
  });
}

class MyBook{

  String name;
  String author;
  String description;
  String genre;
  String location;

  MyBook({
    required this.name,
    required this.author,
    required this.description,
    required this.genre,
    required this.location,
  });
}


List<Book> booksList = [
  Book(
      name: 'Fundamentals of Physics',
      author: 'Halliday, Resnick and Krane',
      description: 'A book on Physics',
      genre: 'Physics',
      location: 'Dhanmondi',
      isWishlisted: false.obs,
  ),
  Book(
      name: 'The Da Vinci Code',
      author: 'Dan Brown',
      description: 'A thriller novel',
      genre: 'Thriller',
      location: 'Mirpur',
      isWishlisted: false.obs,
  ),
  Book(
      name: 'The Alchemist',
      author: 'Paulo Coelho',
      description: 'A fantasy novel',
      genre: 'Fantasy',
      location: 'Kallyanpur',
      isWishlisted: false.obs,
  ),
  Book(name: 'Advanced Engineering Mathematics',
      author: 'H K Dass',
      description: 'A book on Mathematics',
      genre: 'Mathematics',
      location: 'Dhanmondi',
      isWishlisted: false.obs,
  ),
];
var wishListBooks = <Book>[].obs;
var myBooks = <MyBook>[].obs;
