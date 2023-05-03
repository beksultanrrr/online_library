import 'package:online_library/screens/grades/fifth_grades.dart';
import 'package:online_library/screens/grades/first_grades.dart';
import 'package:online_library/screens/grades/fourth_grades.dart';
import 'package:online_library/screens/grades/second_grades.dart';
import 'package:online_library/screens/grades/seventh.dart';
import 'package:online_library/screens/grades/sixth.dart';
import 'package:online_library/screens/grades/third_grades.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/tap.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../components/button_categories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
const List<String> list = <String>[
  '1-класс',
  '2-класс',
  '3-класс',
  '4-класс',
  "5-класс",
  "6-класс",
  "7-класс"
];

String gradesText = "";
String mobileNumberText = "";
String subjectText = "";
String year_of_publication_text = "";
String authorsText = "";

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late final grades = [
    CategoriesButton(
        text: "1-класс",
        ontap: () {
          Navigator.pushNamed(context, FirstGrades.id);
        }),
    CategoriesButton(
        text: "2-класс",
        ontap: () {
          Navigator.pushNamed(context, SecondGrades.id);
        }),
    CategoriesButton(
        text: "3-класс",
        ontap: () {
          Navigator.pushNamed(context, ThirdGrades.id);
        }),
    CategoriesButton(
        text: "4-класс",
        ontap: () {
          Navigator.pushNamed(context, FourhGrades.id);
        }),
    CategoriesButton(
        text: "5-класс",
        ontap: () {
          Navigator.pushNamed(context, FifthGrades.id);
        }),
    CategoriesButton(
        text: "6-класс",
        ontap: () {
          Navigator.pushNamed(context, SixthGrades.id);
        }),
    CategoriesButton(
        text: "7-класс",
        ontap: () {
          Navigator.pushNamed(context, SeventhGrades.id);
        })
  ];

  final maskFormatter = MaskTextInputFormatter(
    mask: '+# (###) ###-##-##',
  );
  final messageTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Библиотека',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.circleQuestion,
                color: Colors.black,
              ),
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Не нашли нужный учебник?'),
                    content: const Text(
                      'Напишите нам,мы постараемся добавить как можно скорее',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {},
                        child: ElevatedButton(
                          child: const Text("Отправить запрос"),
                          onPressed: () {
                            Navigator.pop(context, 'Cancel');
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) => Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.75,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25.0),
                                    topRight: Radius.circular(25.0),
                                  ),
                                ),
                                child: SingleChildScrollView(
                                  child: Container(
                                    margin: const EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Text(
                                          "Условия пользования",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const GradesDropDown(),
                                        TextField(
                                          onChanged: (value) {
                                            subjectText = value;
                                          },
                                          decoration: InputDecoration(
                                            hintText: "Напишите предмет",
                                            border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade300),
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade300),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade300),
                                            ),
                                          ),
                                        ),
                                        TextField(
                                          onChanged: (value) {
                                            year_of_publication_text = value;
                                          },
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            hintText: "Год издания",
                                            border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade300),
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade300),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade300),
                                            ),
                                          ),
                                        ),
                                        TextField(
                                          onChanged: (value) {
                                            authorsText = value;
                                          },
                                          decoration: InputDecoration(
                                            hintText: "Авторы",
                                            border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade300),
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade300),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade300),
                                            ),
                                          ),
                                        ),
                                        TextField(
                                          onChanged: (value) {
                                            mobileNumberText = value;
                                          },
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [maskFormatter],
                                          decoration: InputDecoration(
                                            hintText:
                                                "Ваш WhatsApp номер: чтобы получить ответ",
                                            border: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade300),
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade300),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade300),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 50,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            messageTextController.clear();
                                            _firestore
                                                .collection('requests')
                                                .add({
                                              'Authors': authorsText,
                                              'grades': gradesText,
                                              'mobileNumber': mobileNumberText,
                                              'subject': subjectText,
                                              'year_of_publication':
                                                  year_of_publication_text,
                                            });
                                            Navigator.pop(context, 'Cancel');
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.blueAccent,
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "Отправить",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Закрыть'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ]),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
          crossAxisSpacing: 3,
          mainAxisSpacing: 4.0,
        ),
        itemCount: grades.length,
        itemBuilder: (context, index) {
          final grade = grades[index];
          return CategoriesButton(text: grade.text, ontap: grade.ontap);
        },
      ),
    );
  }
}

class LinkTextSpan extends TextSpan {
  LinkTextSpan(
      {required TextStyle style, required String url, required String text})
      : super(
            style: style,
            text: text ?? url,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launch(url);
              });
}

class GradesDropDown extends StatefulWidget {
  const GradesDropDown({Key? key}) : super(key: key);

  @override
  State<GradesDropDown> createState() => _GradesDropDownState();
}

class _GradesDropDownState extends State<GradesDropDown> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 28,
      style: const TextStyle(
          color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          gradesText = dropdownValue;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
