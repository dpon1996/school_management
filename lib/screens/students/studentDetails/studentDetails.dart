import 'package:flutter/material.dart';
import 'package:interview/model/student/studentModel.dart';
import 'package:interview/res/values.dart';
import 'package:interview/supportingWidgets/Qtext.dart';

class StudentDetails extends StatelessWidget {
  final StudentModel student;

  const StudentDetails({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: padHorizontal, vertical: padVertical),
      child: Column(
        children: [
          ///image section
          const CircleAvatar(
            radius: 30,
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 16),

          ///name
          QText(student.name,fontSize: 20,fontWeight: FontWeight.w500,),

          ///email
          QText(student.email),
          
          ///age
          QText("Age : ${student.age}")

        ],
      ),
    );
  }
}
