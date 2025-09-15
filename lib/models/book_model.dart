import 'package:get/get.dart';

import '../controllers/databasecontroller.dart';

class MyBook {
  final String id;
  final String name;
  final String author;
  final String description;
  final String genre;
  final String location;
  final String ownerID;

  MyBook({
    required this.id,
    required this.name,
    required this.author,
    required this.description,
    required this.genre,
    required this.location,
    required this.ownerID,
  });

  // 👇 Factory constructor for Firebase snapshots
  factory MyBook.fromMap(String id, Map<String, dynamic> data) {
    return MyBook(
      id: id,
      name: data["name"] ?? "",
      author: data["author"] ?? "",
      description: data["description"] ?? "",
      genre: data["genre"] ?? "",
      location: data["location"] ?? "",
      ownerID: data["ownerId"] ?? "",
    );
  }

  // 👇 Convert to map for uploading to Firebase
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "author": author,
      "description": description,
      "genre": genre,
      "location": location,
      "ownerId": ownerID,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyBook && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

var booksList = <MyBook>[].obs;
var wishListBooks = <MyBook>[].obs;

var particularBooksList = <MyBook>[].obs;
void loadUserBooks(String userId) {
  particularBooksList.bindStream(DatabaseController.to.userBooks(userId));
}

var myBooksList = <MyBook>[].obs;