import 'package:flutter/material.dart';
import 'package:interview/provider/registrationProvider.dart';
import 'package:interview/res/values.dart';
import 'package:interview/supportingWidgets/Qtext.dart';
import 'package:interview/supportingWidgets/loading.dart';
import 'package:provider/provider.dart';

class SubjectDetailsSection extends StatefulWidget {
  const SubjectDetailsSection({Key? key}) : super(key: key);

  @override
  State<SubjectDetailsSection> createState() => _SubjectDetailsSectionState();
}

class _SubjectDetailsSectionState extends State<SubjectDetailsSection> {
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
            if(_registrationProvider.subjectLoading)
              Center(
                child: Loading().circularProgress(),
              ),

            ///title
            if(_registrationProvider.subject != null)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child:  QText("Subject details",fontWeight: FontWeight.w500,fontSize: 15,),
            ),

            ///no data
            if(_registrationProvider.subject == null && !_registrationProvider.subjectLoading)
              const ListTile(
                title: QText("No subject data found"),
              ),

            ///subject details
            if(_registrationProvider.subject != null)
              ListTile(
                dense: true,
                visualDensity: VisualDensity.compact,
                title: QText("${_registrationProvider.subject?.name}"),
                subtitle: QText("${_registrationProvider.subject?.teacher}"),
                trailing: QText("Credit : ${_registrationProvider.subject?.credits}"),
              )
          ],
        ),
      ),
    );
  }
}
