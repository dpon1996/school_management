import 'package:flutter/material.dart';
import 'package:interview/contorl/printString.dart';
import 'package:interview/model/student/studentModel.dart';
import 'package:interview/model/subject/subjectModel.dart';
import 'package:interview/provider/registrationProvider.dart';
import 'package:interview/res/values.dart';
import 'package:interview/screens/registration/newRegistration/selectStudent.dart';
import 'package:interview/screens/registration/newRegistration/selectSubject.dart';
import 'package:interview/supportingWidgets/QButton.dart';
import 'package:interview/supportingWidgets/Qtext.dart';
import 'package:interview/supportingWidgets/alert/showSnackBar.dart';
import 'package:provider/provider.dart';

class NewRegistrationPage extends StatefulWidget {
  const NewRegistrationPage({Key? key}) : super(key: key);

  @override
  State<NewRegistrationPage> createState() => _NewRegistrationPageState();
}

class _NewRegistrationPageState extends State<NewRegistrationPage> {
  StudentModel? student;
  SubjectModel? subject;
  RegistrationProvider _registrationProvider = RegistrationProvider();

  @override
  Widget build(BuildContext context) {
    _registrationProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text("New Registration Page"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: padHorizontal,
          vertical: padVertical,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(defaultRadius),
              child: Container(
                color: Colors.grey.shade200,
                child: ListTile(
                  onTap: _getStudent,
                  title: QText(
                      student != null ? student!.name : "Select a student"),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(defaultRadius),
              child: Container(
                color: Colors.grey.shade200,
                child: ListTile(
                  onTap: _getSubject,
                  title: QText(
                    subject != null ? subject!.name : "Select a subject",
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                ),
              ),
            ),
            const SizedBox(height: 16),
            QButton(
              onTap: _validate,
              loading:_registrationProvider.registrationLoading ,
              title: "Register",
            ),
          ],
        ),
      ),
    );
  }

  _getSubject() async {
    SubjectModel? data = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const SelectSubject(),
      ),
    );
    PrintString(data?.toJson());
    if (data != null) {
      setState(() {
        subject = data;
      });
    }
  }

  _getStudent() async {
    StudentModel? data = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const SelectStudent(),
      ),
    );
    PrintString(data?.toJson());
    if (data != null) {
      setState(() {
        student = data;
      });
    }
  }

  _validate() {
    if(student == null){
      showSnackBar("Select a student");
      return;
    }
    if(subject == null){
      showSnackBar("Select a subject");
      return;
    }

    if(!_registrationProvider.registrationLoading){
      _registrationProvider.newRegistrationApiCall(student!.id, subject!.id);
    }

  }
}
