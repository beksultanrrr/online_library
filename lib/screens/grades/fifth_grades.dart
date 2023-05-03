import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/books.model.dart';
import '../book.dart';

class FifthGrades extends StatefulWidget {
  static const String id = "fifth_grades";
  const FifthGrades({Key? key}) : super(key: key);

  @override
  State<FifthGrades> createState() => _FifthGradesState();
}

class _FifthGradesState extends State<FifthGrades> {
  late List<int> idNumber = [
    164,
    157,
    152,
    151,
    132,
    136,
    757,
    146,
    145,
    141,
    121,
    162,
  ];

  late final books = <BookModel>[];

  @override
  Widget build(BuildContext context) {
    for (var id in idNumber) {
      final book = BookModel(
        id: id,
        title: 'Book $id',
        image: 'https://okulyk.kz/wp-content/books/$id/$id.jpg',
        pdfUrl: 'https://oqylyq.online/wp-content/books/$id/$id.pdf',
      );
      books.add(book);
    }
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
            '5 класс',
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
