import 'package:flutter/material.dart';
import 'package:interview/contorl/navigationHelper.dart';
import 'package:interview/res/values.dart';
import 'package:interview/screens/classRoom/classRoomPage.dart';
import 'package:interview/screens/registration/registrationPage.dart';
import 'package:interview/screens/students/studentsPage.dart';
import 'package:interview/screens/subject/subjectPage.dart';
import 'package:interview/supportingWidgets/QINkWell.dart';
import 'package:interview/supportingWidgets/Qtext.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _dashBoardList = [
    {
      "title": "Students",
      "page": const StudentsPage(),
    },
    {
      "title": "Subjects",
      "page": const SubjectPage(),
    },
    {
      "title": "Class Room",
      "page": const ClassRoomPage(),
    },
    {
      "title": "Registration",
      "page": const RegistrationPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: padHorizontal,vertical: padVertical),
        itemCount: _dashBoardList.length,
        itemBuilder: (BuildContext context, int index) {
          Map data = _dashBoardList[index];
          return QInkWell(
            onTap: (){
              push(context, data["page"]);
            },
            child: Container(
              height: 100,
              alignment: Alignment.center,
              color: Colors.green.shade200,
              child: QText(data["title"]),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 8);
        },
      ),
    );
  }
}
