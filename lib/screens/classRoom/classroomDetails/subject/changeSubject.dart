import 'package:flutter/material.dart';
import 'package:interview/contorl/printString.dart';
import 'package:interview/model/subject/subjectModel.dart';
import 'package:interview/provider/classProvider.dart';
import 'package:interview/screens/subject/subjectList.dart';
import 'package:provider/provider.dart';

import '../../../../supportingWidgets/loading.dart';
import '../../../../supportingWidgets/nodata.dart';

class ChangeSubject extends StatefulWidget {
  const ChangeSubject({Key? key}) : super(key: key);

  @override
  State<ChangeSubject> createState() => _ChangeSubjectState();
}

class _ChangeSubjectState extends State<ChangeSubject> {
  ClassProvider _classProvider = ClassProvider();

  @override
  Widget build(BuildContext context) {
    _classProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text("Change subject"),
      ),

      body: Stack(
        children: [
          SubjectList(
            subjectList: _classProvider.subjectList,
            onSelected: _changeSubject
          ),

          ///no data
          if (_classProvider.subjectList.isEmpty) const NoData(),

          ///loading
          if (_classProvider.subjectListLoading)
            Loading().fullScreenLoading(),
        ],
      ),

    );
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _classProvider.getSubjectListApiCall();
    });
    super.initState();
  }

  void _changeSubject(SubjectModel subject) {
    if(_classProvider.subject != null && subject.id == _classProvider.subject!.id){
      Navigator.pop(context);
      return;
    }
    _classProvider.changeSubjectApiCall(subject.id);
    Navigator.pop(context);
  }
}
