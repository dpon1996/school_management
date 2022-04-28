import 'package:flutter/material.dart';
import 'package:interview/res/values.dart';
import 'package:interview/screens/registration/registrationDetails/studentDetailsSection.dart';
import 'package:interview/screens/registration/registrationDetails/subjectDetailsSection.dart';

class RegDetails extends StatelessWidget {
  const RegDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: padHorizontal,vertical: padVertical),
      child: Column(
        children: const [
          /// student details
          StudentDetailsSection(),

          SizedBox(height: 16),

          ///subject details
          SubjectDetailsSection(),

        ],
      ),
    );
  }
}
