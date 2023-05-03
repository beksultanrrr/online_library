import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/books.model.dart';
import '../book.dart';

class FirstGrades extends StatefulWidget {
  static const String id = "books";
  const FirstGrades({Key? key}) : super(key: key);

  @override
  State<FirstGrades> createState() => _FirstGradesState();
}

class _FirstGradesState extends State<FirstGrades> {
  late final books = [
    BookModel(
        id: 0,
        title: '',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwUw5S7w21z654ehX-zLvfItvqW6PXMSeW1qxScEBgjLKL97Be',
        pdfUrl: 'https://oqylyq.online/wp-content/books/14/14.pdf'),
    BookModel(
        id: 1,
        title: '',
        image: 'https://www.okulyk.kz/wp-content/books/917/917.jpg',
        pdfUrl: 'https://oqylyq.online/wp-content/books/917/917.pdf'),
    BookModel(
        id: 2,
        title: '',
        image: 'https://www.okulyk.kz/wp-content/books/914/914.jpg',
        pdfUrl: 'https://oqylyq.online/wp-content/books/914/914.pdf'),
    BookModel(
        id: 3,
        title: '',
        image: 'https://www.okulyk.kz/wp-content/books/916/916.jpg',
        pdfUrl: 'https://oqylyq.online/wp-content/books/914/914.pdf'),
    BookModel(
        id: 4,
        title: '',
        image: 'https://www.okulyk.kz/wp-content/books/921/921.jpg',
        pdfUrl: 'https://oqylyq.online/wp-content/books/921/921.pdf'),
    BookModel(
        id: 5,
        title: '',
        image: 'https://www.okulyk.kz/wp-content/books/912/912.jpg',
        pdfUrl: 'https://oqylyq.online/wp-content/books/912/912.pdf'),
    BookModel(
        id: 6,
        title: '',
        image: 'https://www.okulyk.kz/wp-content/books/919/919.jpg',
        pdfUrl: 'https://oqylyq.online/wp-content/books/919/919.pdf'),
  ];

  @override
  Widget build(BuildContext context) {
    // List<Widget> tasks = [
    //   GestureDetector()
    //   Image.asset('assets/images/mathematic1.jpg'),
    //   Image.asset('assets/images/mathematic1.jpg'),
    //   Image.asset('assets/images/mathematic1.jpg'),
    //   Image.asset('assets/images/mathematic1.jpg'),
    //   Image.asset('assets/images/mathematic1.jpg'),
    // ];
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            '1 класс',
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
