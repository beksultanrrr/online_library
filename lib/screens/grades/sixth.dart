import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/books.model.dart';
import '../book.dart';

class SixthGrades extends StatefulWidget {
  static const String id = "sixth_grades";
  const SixthGrades({Key? key}) : super(key: key);

  @override
  State<SixthGrades> createState() => _SixthGradesState();
}

class _SixthGradesState extends State<SixthGrades> {
  late List<int> idNumber = [
   963,
   228,
   229,
   227,
   225,
   224,
   216,
   218,
   212,
   900,
   169,
   762,
   763,
   210,
   223,
   911,
   202,
   220,
   222,
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
            '6 класс',
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
