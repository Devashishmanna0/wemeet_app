import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:we_meet/resources/auth_methods.dart';
import 'package:we_meet/screen/home_Screen.dart';
import 'package:we_meet/screen/loginScreen.dart';
import 'package:we_meet/screen/video_call_screen.dart';
import 'package:we_meet/utils/colors.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyB2dVIdsaYdSkRLYelLmj0QerQx425UwO0',
          appId: '1:962114028874:web:a4317613a35235483c2db3',
          messagingSenderId: '962114028874',
          projectId: 'wemeeet-e783d',
          storageBucket: "wemeeet-e783d.appspot.com",
      ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WeMeet',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //useMaterial3: true,
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/Home': (context) => const HomeScreen(),
        '/Video-Call': (context) => const VideoCallScreen(),
      },
      home: StreamBuilder(
        stream: AuthMethods().authChanges,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(),
            );
          }
          if(snapshot.hasData){
            return const HomeScreen();
          }

          return const LoginScreen();
        },

      ),
    );
  }
}

