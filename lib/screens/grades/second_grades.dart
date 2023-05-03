import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/books.model.dart';
import '../book.dart';

class SecondGrades extends StatefulWidget {
  static const String id = "second_grades";
  const SecondGrades({Key? key}) : super(key: key);

  @override
  State<SecondGrades> createState() => _SecondGradesState();
}

class _SecondGradesState extends State<SecondGrades> {
  late final books = [
    BookModel(
        id: 0,
        title: '',
        image: 'https://www.okulyk.kz/wp-content/books/44/44.jpg',
        pdfUrl: 'https://oqylyq.online/wp-content/books/44/44.pdf'),
    BookModel(
        id: 1,
        title: '',
        image: 'https://www.okulyk.kz/wp-content/books/41/41.jpg',
        pdfUrl: 'https://oqylyq.online/wp-content/books/41/41.pdf'),
    BookModel(
        id: 2,
        title: '',
        image: 'https://www.okulyk.kz/wp-content/books/649/649.jpg',
        pdfUrl: 'https://oqylyq.online/wp-content/books/649/649.pdf'),
    BookModel(
        id: 3,
        title: '',
        image: 'https://www.okulyk.kz/wp-content/books/48/48.jpg',
        pdfUrl: 'https://oqylyq.online/wp-content/books/48/48.pdf'),
    BookModel(
        id: 4,
        title: '',
        image: 'https://www.okulyk.kz/wp-content/books/45/45.jpg',
        pdfUrl: 'https://oqylyq.online/wp-content/books/45/45.pdf'),
    BookModel(
        id: 5,
        title: '',
        image: 'https://www.okulyk.kz/wp-content/books/656/656.jpg',
        pdfUrl: 'https://oqylyq.online/wp-content/books/656/656.pdf'),
    BookModel(
        id: 6,
        title: '',
        image: 'https://www.okulyk.kz/wp-content/books/849/849.jpg',
        pdfUrl: 'https://oqylyq.online/wp-content/books/849/849.pdf'),
    BookModel(
        id: 7,
        title: '',
        image: 'https://www.okulyk.kz/wp-content/books/46/46.jpg',
        pdfUrl: 'https://oqylyq.online/wp-content/books/46/46.pdf'),
    BookModel(
        id: 8,
        title: '',
        image: 'https://www.okulyk.kz/wp-content/books/47/47.jpg',
        pdfUrl: 'https://oqylyq.online/wp-content/books/47/47.pdf'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            '2 класс',
            style: TextStyle(color: Colors.black),
          ),
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return Book(
              image: Image.network(
                book.image ?? '',
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
              ontap: () => _launchURL(book.pdfUrl));
        },
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
