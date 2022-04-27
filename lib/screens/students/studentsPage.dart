import 'package:flutter/material.dart';
import 'package:interview/contorl/navigationHelper.dart';
import 'package:interview/model/student/studentModel.dart';
import 'package:interview/provider/studentProvider.dart';
import 'package:interview/screens/students/studentDetails/studentDetailsPage.dart';
import 'package:interview/supportingWidgets/Qtext.dart';
import 'package:provider/provider.dart';

import '../../supportingWidgets/loading.dart';
import '../../supportingWidgets/nodata.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({Key? key}) : super(key: key);

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  StudentProvider _studentProvider = StudentProvider();

  @override
  Widget build(BuildContext context) {
    _studentProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text("Students Page"),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: _studentProvider.studentList.length,
            itemBuilder: (BuildContext context, int index) {
              StudentModel student = _studentProvider.studentList[index];
              return ListTile(
                onTap: () {
                  push(context, StudentDetailsPage(studentId: student.id));
                },
                tileColor: index % 2 == 0 ? Colors.grey.shade200 : Colors.white,
                title: QText('${student.name} '),
                subtitle: QText('${student.email} '),
                trailing: QText('Age : ${student.age}'),
              );
            },
          ),

          ///no data
          if (_studentProvider.studentList.isEmpty) const NoData(),

          ///loading
          if (_studentProvider.studentListLoading)
            Loading().fullScreenLoading(),
        ],
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _studentProvider.getStudentListApiCall();
    });
    super.initState();
  }
}
