import 'package:flutter/material.dart';
import 'package:interview/provider/registrationProvider.dart';
import 'package:interview/screens/students/studentList.dart';
import 'package:provider/provider.dart';

import '../../../supportingWidgets/loading.dart';

class SelectStudent extends StatefulWidget {
  const SelectStudent({Key? key}) : super(key: key);

  @override
  State<SelectStudent> createState() => _SelectStudentState();
}

class _SelectStudentState extends State<SelectStudent> {
  RegistrationProvider _registrationProvider = RegistrationProvider();

  @override
  Widget build(BuildContext context) {
    _registrationProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text("Select Subject"),
      ),
      body: Stack(
        children: [
          ///
          StudentList(
            studentList: _registrationProvider.studentList,
            selectedStudent: (val) {
              Navigator.pop(context,val);
            },
          ),

          ///loading
          if (_registrationProvider.studentListLoading)
            Loading().fullScreenLoading(),
        ],
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _registrationProvider.getStudentListApiCall();
    });
    super.initState();
  }
}
