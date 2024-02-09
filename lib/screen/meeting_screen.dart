import 'dart:math';

import 'package:flutter/material.dart';
import 'package:we_meet/widgets/home_meeting_button.dart';
import 'package:we_meet/resources/jitsi_meet_methods.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen ({Key? key}) : super(key: key);

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  createMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
        roomName: roomName,
        isAudioMuted: true,
        isVideoMuted: true,
    );
  }

  joinMeeting(BuildContext context){
    Navigator.pushNamed(context, '/Video-Call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onPressed: createMeeting,
              icon: Icons.videocam,
              text: 'New Meeting',
            ),
            HomeMeetingButton(
              onPressed: () => joinMeeting(context),
              icon: Icons.add_box_rounded,
              text: 'Join Meeting',
            ),
            HomeMeetingButton(
              onPressed: (){},
              icon: Icons.calendar_today,
              text: 'Schedule Meeting',
            ),
            HomeMeetingButton(
              onPressed: (){},
              icon: Icons.arrow_upward_rounded,
              text: 'Share Screen',
            )
          ],
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Create/Join Meetings with just a click!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }

}
