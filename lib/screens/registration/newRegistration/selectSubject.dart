import 'package:flutter/material.dart';
import 'package:interview/contorl/printString.dart';
import 'package:interview/provider/registrationProvider.dart';
import 'package:interview/screens/subject/subjectList.dart';
import 'package:interview/supportingWidgets/loading.dart';
import 'package:provider/provider.dart';

class SelectSubject extends StatefulWidget {
  const SelectSubject({Key? key}) : super(key: key);

  @override
  State<SelectSubject> createState() => _SelectSubjectState();
}

class _SelectSubjectState extends State<SelectSubject> {
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
          SubjectList(
            subjectList: _registrationProvider.subjectList,
            onSelected: (val) {
              Navigator.pop(context,val);
            },
          ),


          ///loading
          if(_registrationProvider.subjectListLoading)
            Loading().fullScreenLoading(),

        ],
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _registrationProvider.getSubjectListApiCall();
    });
    super.initState();
  }
}
