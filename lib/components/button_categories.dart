import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesButton extends StatelessWidget {
  const CategoriesButton({required this.text, required this.ontap});
  final String text;
  final ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(7),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: 70,
          width: 160,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 57, 135, 223),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
