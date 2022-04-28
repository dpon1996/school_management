import 'package:flutter/material.dart';
import 'package:interview/res/colors.dart';
import 'package:interview/res/images.dart';

class ConferenceRoomLayout extends StatelessWidget {
  final int size;

  const ConferenceRoomLayout({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      sliver: SliverToBoxAdapter(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _seatList(
                size: size - (size ~/ 2),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.red,
                height: ((size - (size ~/ 2)) * 58) - 8,
              ),
            ),
            Expanded(
              child: _seatList(size: size ~/ 2),
            ),
          ],
        ),
      ),
    );
  }

  _seatList({required int size}) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: size,
      itemBuilder: (BuildContext context, int index) {
        return Center(
          child: SizedBox(
            height: 50,
            width: 50,
            child: Image.asset(seatImg),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 8);
      },
    );
  }
}
