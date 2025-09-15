import 'package:bookio/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

import '../models/book_model.dart';

class DatabaseController extends GetxController {
  static DatabaseController get to => Get.find();
  final instance = FirebaseDatabase.instance;
  final DatabaseReference _booksRef = FirebaseDatabase.instance.ref("books");
  final DatabaseReference _wishRef = FirebaseDatabase.instance.ref("wishlists");
  final userRef = FirebaseDatabase.instance.ref("Users");
  AuthController auth = Get.find<AuthController>();

  String? get userId => auth.user?.uid;

  /// Add book
  Future<void> addBook(MyBook book) async {
    final newBookRef = _booksRef.push(); // generate Firebase key
    final bookId = newBookRef.key!;

    final newBook = MyBook(
      id: bookId,
      name: book.name,
      author: book.author,
      description: book.description,
      genre: book.genre,
      location: book.location,
      ownerID: userId!,
    );

    await newBookRef.set({
      ...newBook.toMap(),
      "ownerId": userId,
    });

    await FirebaseDatabase.instance
        .ref("users/${AuthController.to.user!.uid}/myBooks")
        .push()
        .set(bookId);
  }


  /// Delete book
  Future<void> deleteBook(String key) async {
    await _booksRef.child(key).remove();
  }

  /// Update book
  Future<void> updateBook(String key, MyBook updatedBook) async {
    await _booksRef.child(key).update({
      "name": updatedBook.name,
      "author": updatedBook.author,
      "description": updatedBook.description,
      "genre": updatedBook.genre,
      "location": updatedBook.location,
    });
  }

  /// Add to wishlist
  Future<void> addToWishlist(String bookId) async {
    await _wishRef.child(userId!).child(bookId).set(true);
  }

  /// Remove from wishlist
  Future<void> removeFromWishlist(String bookId) async {
    await _wishRef.child(userId!).child(bookId).remove();
  }

  /// Stream: Home books (all except mine)
  Stream<List<MyBook>> homeBooks() {
    return _booksRef.onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>? ?? {};
      return data.entries.map((e) {
        final value = Map<String, dynamic>.from(e.value);
        return MyBook.fromMap(
          e.key, // Firebase key as id
          value,
        );
      }).where((book) => book.ownerID != userId).toList();
    });
  }


  /// Stream: My books
  Stream<List<MyBook>> myBooks() {
    return _booksRef.onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>? ?? {};
      return data.entries.map((e) {
        final value = Map<String, dynamic>.from(e.value);
        return MyBook.fromMap(
          e.key,
          value,
        );
      }).where((book) => book.ownerID == userId).toList();
    });
  }


  /// Stream: Particular user's books
  Stream<List<MyBook>> userBooks(String? particularUserID) {
    return _booksRef.onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>? ?? {};
      return data.entries.map((e) {
        final value = Map<String, dynamic>.from(e.value);
        return MyBook.fromMap(
          e.key,
          value,
        );
      }).where((book) => book.ownerID == particularUserID).toList();
    });
  }

  /// Stream: Wishlist
  Stream<List<MyBook>> wishlistBooks() {
    if (userId == null) return const Stream.empty();

    return _wishRef
        .child(userId!)
        .onValue
        .asyncMap((wishlistEvent) async {
      final wishData = wishlistEvent.snapshot.value as Map<dynamic, dynamic>? ??
          {};
      final bookIds = wishData.keys.toList();

      final allBooksSnap = await _booksRef.get();
      if (!allBooksSnap.exists) return [];

      final allBooks = Map<dynamic, dynamic>.from(allBooksSnap.value as Map);

      return bookIds.where(allBooks.containsKey).map((id) {
        final value = Map<String, dynamic>.from(allBooks[id]);
        return MyBook(
          id: id,
          // book id from wishlist
          name: value["name"] ?? "",
          author: value["author"] ?? "",
          description: value["description"] ?? "",
          genre: value["genre"] ?? "",
          location: value["location"] ?? "",
          ownerID: value["ownerId"] ?? "",
        );
      }).toList();
    });
  }

  //binding stream with observable list
  @override
  void onInit() {
    super.onInit();
    // Now you pass the Rxn<User> itself
    ever(auth.firebaseUser, (user) {
      if (user != null) {
        booksList.bindStream(homeBooks());
        wishListBooks.bindStream(wishlistBooks());
        myBooksList.bindStream(myBooks());
      } else {
        booksList.clear();
        wishListBooks.clear();
        myBooksList.clear();
      }
    });
  }
}