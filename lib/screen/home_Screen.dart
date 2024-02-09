import 'package:flutter/material.dart';
import 'package:we_meet/screen/history_meeting_screen.dart';
import 'package:we_meet/screen/meeting_screen.dart';
import 'package:we_meet/screen/home_Screen.dart';
import 'package:we_meet/utils/colors.dart';
//import 'package:we_meet/widgets/home_meeting_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingScreen(),
    const HistoryMeetingScreen(),
    const Text('Contacts'),
    const Text('Settings'),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text('Meet & chat'),
        centerTitle: true,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        //type: BottomNavigationBarType.fixed,
        //unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.comment_bank,),
            label: 'Meet & chat'
          ),

          BottomNavigationBarItem(icon: Icon(Icons.lock_clock,),
              label: 'Meetings'
          ),

          BottomNavigationBarItem(icon: Icon(Icons.person_outline,),
              label: 'Contacts'
          ),

          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined,),
              label: 'Settings'
          ),

        ],
      ),
    );
  }
}

