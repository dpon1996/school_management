import 'package:flutter/material.dart';
import 'package:interview/model/subject/subjectModel.dart';

import '../../supportingWidgets/Qtext.dart';

class SubjectList extends StatefulWidget {
  final List<SubjectModel> subjectList;
  final ValueChanged<SubjectModel> onSelected;

  const SubjectList(
      {Key? key, required this.subjectList, required this.onSelected})
      : super(key: key);

  @override
  State<SubjectList> createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.subjectList.length,
      itemBuilder: (BuildContext context, int index) {
        SubjectModel subject = widget.subjectList[index];
        return ListTile(
          onTap: () {
            setState(() {
              widget.onSelected(subject);
            });
          },
          tileColor: index % 2 == 0 ? Colors.grey.shade200 : Colors.white,
          title: QText('${subject.name} '),
          subtitle: QText('${subject.teacher} '),
          trailing: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              QText(
                "${subject.credits}",
                fontWeight: FontWeight.w500,
              ),
              const QText("credit"),
            ],
          ),
        );
      },
    );
  }
}
