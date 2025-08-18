import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/book_model.dart';

class BookAddForm extends StatefulWidget {
  const BookAddForm({super.key});

  @override
  State<BookAddForm> createState() => _BookAddFormState();
}

class _BookAddFormState extends State<BookAddForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController genreController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    authorController.dispose();
    descriptionController.dispose();
    genreController.dispose();
    locationController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newBook = MyBook(
        name: nameController.text,
        author: authorController.text,
        description: descriptionController.text,
        genre: genreController.text,
        location: locationController.text,
      );

      // You can push this book into your observable list
      myBooks.add(newBook);

      Navigator.pop(context, newBook); // Return book to previous page
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff4d75e),
        title: const Text('Add Book'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Book Name'),
                validator: (value) =>
                value == null || value.isEmpty ? 'Enter book name' : null,
              ),
              TextFormField(
                controller: authorController,
                decoration: const InputDecoration(labelText: 'Author'),
                validator: (value) =>
                value == null || value.isEmpty ? 'Enter author name' : null,
              ),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              TextFormField(
                controller: genreController,
                decoration: const InputDecoration(labelText: 'Genre'),
              ),
              TextFormField(
                controller: locationController,
                decoration:
                const InputDecoration(labelText: 'Location of sharing'),
              ),
              const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffd4b200),
                  ),
                  child: const Text('Add Book'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
