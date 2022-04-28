import 'package:flutter/material.dart';
import 'package:interview/contorl/navigationHelper.dart';
import 'package:interview/provider/classProvider.dart';
import 'package:interview/res/colors.dart';
import 'package:interview/res/values.dart';
import 'package:interview/screens/classRoom/classroomDetails/subject/changeSubject.dart';
import 'package:interview/supportingWidgets/QButton.dart';
import 'package:interview/supportingWidgets/Qtext.dart';
import 'package:interview/supportingWidgets/loading.dart';
import 'package:provider/provider.dart';

class SubjectDetails extends StatefulWidget {
  const SubjectDetails({Key? key}) : super(key: key);

  @override
  State<SubjectDetails> createState() => _SubjectDetailsState();
}

class _SubjectDetailsState extends State<SubjectDetails> {
  ClassProvider _classProvider = ClassProvider();

  @override
  Widget build(BuildContext context) {
    _classProvider = Provider.of(context);
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.grey.shade200,
        child: Column(
          children: [
            if (_classProvider.subjectLoading)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: padVertical),
                child: Loading().circularProgress(),
              ),

            ///subject details
            if (_classProvider.subject != null)
              ListTile(
                title: QText(_classProvider.subject!.name),
                subtitle: QText(_classProvider.subject!.teacher),
                trailing: QButton(
                  onTap: () {
                    push(context, const ChangeSubject());
                  },
                  width: null,
                  height: 35,
                  radius: 20,
                  color: appGreen.withOpacity(.2),
                  title: "change",
                  titleColor: appGreen,
                  titleSize: 12,
                ),
              ),

            ///add subject
            if (_classProvider.subject == null && !_classProvider.subjectLoading)
              ListTile(
                title: const QText("Add subject"),
                trailing: QButton(
                  onTap: () {
                    push(context, const ChangeSubject());
                  },
                  width: null,
                  height: 35,
                  radius: 20,
                  color: appGreen.withOpacity(.2),
                  title: "ADD",
                  titleColor: appGreen,
                  titleSize: 12,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
