import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/books.model.dart';
import '../book.dart';

class FourhGrades extends StatefulWidget {
  static const String id = "fourth_grades";
  const FourhGrades({Key? key}) : super(key: key);

  @override
  State<FourhGrades> createState() => _FourhGradesState();
}

class _FourhGradesState extends State<FourhGrades> {
  late List<int> idNumber = [
    752,
    108,
    107,
    77,
    102,
    886,
    112,
    110,
    96,
    79,
    111
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

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            '4 класс',
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
