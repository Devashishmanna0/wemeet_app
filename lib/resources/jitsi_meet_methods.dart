import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:we_meet/resources/auth_methods.dart';
//import 'package:jitsi_meet/feature_flag/feature_flag.dart';
//import 'package:we_meet/resources/fire'


class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods();
  //final FirestoreMethods _firestoreMethods = FirestoreMethods();
  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',}) async {
    var jitsiMeet = JitsiMeet();
    try {
      //FeatureFlag featureFlag = FeatureFlag();
      //featureFlag.welcomePageEnabled = false;
      //featureFlag.resolution = FeatureFlagVideoResolution.MD_RESOLUTION;

      String name;
      if (username.isEmpty) {
        name = _authMethods.user.displayName!;
      } else {
        name = username;
      }
      var options = JitsiMeetConferenceOptions(
        //serverURL: "https://meet.jit.si",
        room: roomName,
        configOverrides: {
          "startWithAudioMuted": isAudioMuted,
          "startWithVideoMuted": isVideoMuted,
          "subject" : "Jitsi with Flutter",
        },

        userInfo: JitsiMeetUserInfo(
            displayName: name,
            email: _authMethods.user.email,
            avatar: _authMethods.user.photoURL
        ),
        featureFlags: {
          "unsaferoomwarning.enabled": false
        },
      );

      //_firestoreMethods.addToMeetingHistory(roomName);
      await jitsiMeet.join(options);

    } catch (error) {
      print("error: $error");
    }
  }
}

