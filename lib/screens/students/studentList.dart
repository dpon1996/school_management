import 'package:flutter/material.dart';
import 'package:interview/model/student/studentModel.dart';
import 'package:interview/supportingWidgets/Qtext.dart';

class StudentList extends StatefulWidget {
  final List<StudentModel> studentList;
  final ValueChanged<StudentModel> selectedStudent;

  const StudentList({Key? key,required this.studentList,required this.selectedStudent}) : super(key: key);

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.studentList.length,
      itemBuilder: (BuildContext context, int index) {
        StudentModel student = widget.studentList[index];
        return ListTile(
          onTap: () {
            setState(() {
              widget.selectedStudent(student);
            });
          },
          tileColor: index % 2 == 0 ? Colors.grey.shade200 : Colors.white,
          title: QText('${student.name} '),
          subtitle: QText('${student.email} '),
          trailing: QText('Age : ${student.age}'),
        );
      },
    );
  }
}
