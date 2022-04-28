import 'package:flutter/material.dart';
import 'package:interview/provider/registrationProvider.dart';
import 'package:interview/res/values.dart';
import 'package:interview/supportingWidgets/Qtext.dart';
import 'package:interview/supportingWidgets/loading.dart';
import 'package:provider/provider.dart';

class StudentDetailsSection extends StatefulWidget {
  const StudentDetailsSection({Key? key}) : super(key: key);

  @override
  State<StudentDetailsSection> createState() => _StudentDetailsSectionState();
}

class _StudentDetailsSectionState extends State<StudentDetailsSection> {
  RegistrationProvider _registrationProvider = RegistrationProvider();

  @override
  Widget build(BuildContext context) {
    _registrationProvider = Provider.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(defaultRadius),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),

        color: Colors.grey.shade200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///loading
            if(_registrationProvider.studentLoading)
              Center(
                child: Loading().circularProgress(),
              ),

            ///title
            if(_registrationProvider.student != null)
              const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child:  QText("Student details",fontWeight: FontWeight.w500,fontSize: 15,),
            ),


            /// no data
            if(_registrationProvider.student == null && !_registrationProvider.studentLoading)
              const ListTile(
                title: QText("No student data found"),
              ),

            ///student details
            if(_registrationProvider.student != null)
              ListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
                title: QText("${_registrationProvider.student?.name}"),
                subtitle: QText("${_registrationProvider.student?.email}"),
                trailing: QText("Age : ${_registrationProvider.student?.age}"),
              )
          ],
        ),
      ),
    );
  }
}
