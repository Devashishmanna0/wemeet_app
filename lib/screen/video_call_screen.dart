import 'package:flutter/material.dart';
import 'package:we_meet/resources/auth_methods.dart';
import 'package:we_meet/utils/colors.dart';
import 'package:we_meet/widgets/meeting_option.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _VideoCallScreenState();

}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethods _authMethods = AuthMethods();
  late TextEditingController meetingIDController;
  late TextEditingController nameController = TextEditingController();

  @override
  void initState(){
    meetingIDController = TextEditingController();
    nameController = TextEditingController(
      text: _authMethods.user.displayName,
    );
    super.initState();
  }

  _joinMeeting(){

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text('Join Meeting',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              controller: meetingIDController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Room ID',
                contentPadding: EdgeInsets.fromLTRB(16, 18, 0, 0)
              ),
            ),
          ),

          SizedBox(
            height: 60,
            child: TextField(
              controller: nameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Name',
                  contentPadding: EdgeInsets.fromLTRB(16, 18, 0, 0)
              ),
            ),
          ),
          const SizedBox(height: 20,),
          InkWell(
            onTap: _joinMeeting,
            child: const Padding(
                padding: EdgeInsets.all(8),
              child: Text('Join', style: TextStyle(
                fontSize: 16,
              ),),
            ),
          ),
          const SizedBox(height: 20,),
          MeetingOption(text: text)
        ],
      ),
    );
  }
}