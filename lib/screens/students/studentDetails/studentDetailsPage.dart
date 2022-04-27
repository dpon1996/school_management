import 'package:flutter/material.dart';
import 'package:interview/provider/studentProvider.dart';
import 'package:interview/screens/students/studentDetails/studentDetails.dart';
import 'package:provider/provider.dart';

import '../../../supportingWidgets/loading.dart';
import '../../../supportingWidgets/nodata.dart';

class StudentDetailsPage extends StatefulWidget {
  final int studentId;

  const StudentDetailsPage({Key? key, required this.studentId})
      : super(key: key);

  @override
  State<StudentDetailsPage> createState() => _StudentDetailsPageState();
}

class _StudentDetailsPageState extends State<StudentDetailsPage> {
  StudentProvider _studentProvider = StudentProvider();

  @override
  Widget build(BuildContext context) {
    _studentProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text("Student details"),
      ),
      body: Stack(
        children: [

          if(_studentProvider.studentDetails != null)
            StudentDetails(student: _studentProvider.studentDetails!),

          ///no data
          if (_studentProvider.studentDetails == null)
            const NoData(
              text: "Sorry we can't fetch student details\n try again",
            ),

          ///loading
          if (_studentProvider.studentDetailsLoading)
            Loading().fullScreenLoading(),
        ],
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _studentProvider.getStudentDetailsApiCall(widget.studentId);
    });
    super.initState();
  }
}
