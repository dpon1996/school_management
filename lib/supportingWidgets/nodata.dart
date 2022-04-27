import 'package:flutter/material.dart';
import 'package:interview/supportingWidgets/Qtext.dart';

class NoData extends StatefulWidget {
  final String? image;
  final String text;

  const NoData({Key? key, this.image,this.text = "No data"}) : super(key: key);

  @override
  _NoDataState createState() => _NoDataState();
}

class _NoDataState extends State<NoData> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.image != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Image.asset(widget.image!,width: 150,),
            ),
          QText(widget.text,textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
