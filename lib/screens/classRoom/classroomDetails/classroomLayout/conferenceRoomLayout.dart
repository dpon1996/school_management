import 'package:flutter/material.dart';
import 'package:interview/res/colors.dart';
import 'package:interview/res/images.dart';
import 'package:interview/supportingWidgets/Qtext.dart';

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
                alignment: Alignment.center,
                color: Colors.grey.shade400,
                height: ((size - (size ~/ 2)) * 58) - 8,
                child: const RotatedBox(
                  quarterTurns: -1,
                  child: QText(
                    "Desk",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Expanded(
              child: _seatList(size: size ~/ 2,isLeft: false),
            ),
          ],
        ),
      ),
    );
  }

  _seatList({required int size, bool isLeft = true}) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: size,
      itemBuilder: (BuildContext context, int index) {
        return Center(
          child: SizedBox(
            height: 50,
            width: 50,
            child: Transform(
              alignment: Alignment.center,
              transform: isLeft ?Matrix4.rotationY(0) :Matrix4.rotationY(3.14),
              child: Image.asset(seatImg),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 8);
      },
    );
  }
}
