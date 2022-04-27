import 'package:flutter/material.dart';


class SubjectPage extends StatefulWidget {
  const SubjectPage({Key? key}) : super(key: key);

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Stack(
        children: [

        ],
      ),

    );
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
    });
    super.initState();
  }
}
