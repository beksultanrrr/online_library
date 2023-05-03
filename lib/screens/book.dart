// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Book extends StatelessWidget {
  const Book({
    Key? key,
    required this.ontap,
    required this.image,
  }) : super(key: key);
  final Function() ontap;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: GestureDetector(
        child: image,
        onTap: ontap,
      ),
    );
  }
}
