import 'package:flutter/material.dart';
import 'package:interview/res/images.dart';

class ClassroomLayout extends StatelessWidget {
  final int size;

  const ClassroomLayout({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding:const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200)
            ),
            child: Image.asset(seatImg,scale: 10,),
          );
        }, childCount: size),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
