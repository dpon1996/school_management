import 'package:flutter/material.dart';
import 'package:interview/res/images.dart';
import 'package:interview/screens/classRoom/classroomDetails/classroomLayout/classroomLayout.dart';
import 'package:interview/screens/classRoom/classroomDetails/classroomLayout/conferenceRoomLayout.dart';
import 'package:interview/screens/classRoom/classroomDetails/subject/subjectDetails.dart';
import 'package:provider/provider.dart';

import '../../../provider/classProvider.dart';
import '../../../supportingWidgets/loading.dart';
import '../../../supportingWidgets/nodata.dart';

class ClassroomDetailsPage extends StatefulWidget {
  final int classId;

  const ClassroomDetailsPage({Key? key, required this.classId})
      : super(key: key);

  @override
  State<ClassroomDetailsPage> createState() => _ClassroomDetailsPageState();
}

class _ClassroomDetailsPageState extends State<ClassroomDetailsPage> {
  ClassProvider _classProvider = ClassProvider();

  @override
  Widget build(BuildContext context) {
    _classProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text("Classroom details Page"),
      ),
      body: Stack(
        children: [
          if (_classProvider.classDetails != null)
            CustomScrollView(
              slivers: [
                ///subject
                const SubjectDetails(),

                const SliverToBoxAdapter(
                  child: SizedBox(height: 16),
                ),

                ///board
                SliverToBoxAdapter(
                  child: Center(
                    child: Image.asset(
                      boardImg,
                      width: 200,
                    ),
                  ),
                ),

                ///layout
                _classProvider.classDetails!.layout == "conference"
                    ? ConferenceRoomLayout(
                        size: _classProvider.classDetails!.size,
                      )
                    : ClassroomLayout(
                        size: _classProvider.classDetails!.size,
                      ),


              ],
            ),

          ///no data
          if (_classProvider.classDetails == null)
            const NoData(
              text: "Sorry we can't fetch your data\n try again",
            ),

          ///loading
          if (_classProvider.classDetailsLoading) Loading().fullScreenLoading(),
        ],
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _classProvider.getClassDetailsApiCall(widget.classId);
    });
    super.initState();
  }

  @override
  void dispose() {
    _classProvider.clearData();
    super.dispose();
  }
}
