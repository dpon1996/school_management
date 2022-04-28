import 'package:flutter/material.dart';
import 'package:interview/model/subject/subjectModel.dart';
import 'package:interview/provider/subjectProvider.dart';
import 'package:interview/screens/subject/subjectDetails/subjectDetailsPage.dart';
import 'package:interview/screens/subject/subjectList.dart';
import 'package:interview/supportingWidgets/loading.dart';
import 'package:interview/supportingWidgets/nodata.dart';
import 'package:provider/provider.dart';

import '../../contorl/navigationHelper.dart';
import '../../supportingWidgets/Qtext.dart';

class SubjectPage extends StatefulWidget {
  const SubjectPage({Key? key}) : super(key: key);

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  SubjectProvider _subjectProvider = SubjectProvider();

  @override
  Widget build(BuildContext context) {
    _subjectProvider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text("Subject Page"),
      ),
      body: Stack(
        children: [
          SubjectList(
            subjectList: _subjectProvider.subjectList,
            onSelected: (subject) {
              push(context, SubjectDetailsPage(subjectId: subject.id));
            },
          ),

          ///no data
          if (_subjectProvider.subjectList.isEmpty) const NoData(),

          ///loading
          if (_subjectProvider.subjectListLoading)
            Loading().fullScreenLoading(),
        ],
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _subjectProvider.getSubjectList();
    });
    super.initState();
  }
}
