import 'package:flutter/material.dart';
import 'package:interview/screens/subject/subjectDetails/subjectDetails.dart';
import 'package:interview/supportingWidgets/nodata.dart';
import 'package:provider/provider.dart';

import '../../../provider/subjectProvider.dart';
import '../../../supportingWidgets/loading.dart';

class SubjectDetailsPage extends StatefulWidget {
  final int subjectId;
  const SubjectDetailsPage({Key? key,required this.subjectId}) : super(key: key);

  @override
  State<SubjectDetailsPage> createState() => _SubjectDetailsPageState();
}

class _SubjectDetailsPageState extends State<SubjectDetailsPage> {
  SubjectProvider _subjectProvider = SubjectProvider();

  @override
  Widget build(BuildContext context) {
    _subjectProvider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text("Subject details"),
      ),
      body: Stack(
        children: [
          if (_subjectProvider.subjectDetails != null)
            SubjectDetails(subject: _subjectProvider.subjectDetails!),


          ///no data
          if (_subjectProvider.subjectDetails == null)
            const NoData(
              text: "Sorry we can't fetch subject details\n try again",
            ),

          ///loading
          if (_subjectProvider.subjectDetailsLoading)
            Loading().fullScreenLoading(),
        ],
      ),
    );
  }
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _subjectProvider.getSubjectDetails(widget.subjectId);
    });
    super.initState();
  }
}
