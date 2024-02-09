import 'package:flutter/material.dart';
import 'package:we_meet/utils/colors.dart';

class MeetingOption extends StatelessWidget  {
  const MeetingOption({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }

}