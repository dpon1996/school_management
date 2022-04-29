import 'package:flutter/material.dart';
import 'package:interview/contorl/navigationHelper.dart';
import 'package:interview/res/colors.dart';
import 'package:interview/res/images.dart';
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
  bool _isGrid = true;

  final List<Color> _colorList = [
    appGreen,
    appBlue,
    appRed,
    appYellow,
  ];

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
      appBar: AppBar(
        title: const Text("Classroom manager"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isGrid = !_isGrid;
              });
            },
            icon: Icon(!_isGrid ? Icons.dashboard_sharp : Icons.list),
          ),
        ],
      ),
      body: _isGrid ? gridMenu() : listMenu(),
    );
  }

  listMenu() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
          horizontal: padHorizontal, vertical: padVertical),
      itemCount: _dashBoardList.length,
      itemBuilder: (BuildContext context, int index) {
        Map data = _dashBoardList[index];
        return QInkWell(
          onTap: () {
            push(context, data["page"]);
          },
          child: Container(
            height: 100,
            alignment: Alignment.center,
            color: _colorList[index % _colorList.length].withOpacity(.2),
            child: QText(data["title"]),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 8);
      },
    );
  }

  gridMenu() {
    return GridView.builder(
      itemCount: _dashBoardList.length,
      padding: const EdgeInsets.symmetric(
          horizontal: padHorizontal, vertical: padVertical),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
      itemBuilder: (context, index) {
        Map data = _dashBoardList[index];
        return QInkWell(
          onTap: () {
            push(context, data["page"]);
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _colorList[index % _colorList.length].withOpacity(.2),
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  logoIcon,
                  height: 50,
                  color: _colorList[index % _colorList.length],
                ),
                const SizedBox(height: 8),
                QText(data["title"])
              ],
            ),
          ),
        );
      },
    );
  }
}
