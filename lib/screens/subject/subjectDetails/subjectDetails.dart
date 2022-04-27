import 'package:flutter/material.dart';
import 'package:interview/model/subject/subjectModel.dart';

import '../../../res/values.dart';
import '../../../supportingWidgets/Qtext.dart';

class SubjectDetails extends StatelessWidget {
  final SubjectModel subject;

  const SubjectDetails({Key? key,required this.subject}) : super(key: key);

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
              Icons.book_outlined,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 16),

          ///name
          QText(subject.name,fontSize: 20,fontWeight: FontWeight.w500,),

          ///email
          QText(subject.teacher),

          ///age
          QText("Credit : ${subject.credits}")

        ],
      ),
    );
  }
}
