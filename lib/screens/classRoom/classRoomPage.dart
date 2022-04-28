import 'package:flutter/material.dart';
import 'package:interview/contorl/navigationHelper.dart';
import 'package:interview/model/class/classListModel.dart';
import 'package:interview/provider/classProvider.dart';
import 'package:interview/screens/classRoom/classroomDetails/classroomDetailsPage.dart';
import 'package:interview/supportingWidgets/loading.dart';
import 'package:provider/provider.dart';

import '../../supportingWidgets/Qtext.dart';
import '../../supportingWidgets/nodata.dart';

class ClassRoomPage extends StatefulWidget {
  const ClassRoomPage({Key? key}) : super(key: key);

  @override
  State<ClassRoomPage> createState() => _ClassRoomPageState();
}

class _ClassRoomPageState extends State<ClassRoomPage> {
  ClassProvider _classProvider = ClassProvider();
  @override
  Widget build(BuildContext context) {
    _classProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text("Classroom Page"),
      ),
      body: Stack(
        children: [


          ListView.builder(
            itemCount: _classProvider.classList.length,
            itemBuilder: (BuildContext context, int index) {
              ClassListModel classroom = _classProvider.classList[index];
              return ListTile(
                onTap: () {
                  push(context, ClassroomDetailsPage(classId: classroom.id));
                },
                tileColor: index % 2 == 0 ? Colors.grey.shade200 : Colors.white,
                title: QText('${classroom.name} '),
                subtitle: QText('${classroom.layout} '),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    QText(
                      "${classroom.size}",
                      fontWeight: FontWeight.w500,
                    ),
                    const QText("Seats"),
                  ],
                ),
              );
            },
          ),


          ///no data
          if (_classProvider.classList.isEmpty) const NoData(),

          ///loading
          if (_classProvider.classListLoading)
            Loading().fullScreenLoading(),
        ],
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _classProvider.getClassListApiCall();
    });
    super.initState();
  }
}
