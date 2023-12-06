import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scroller_chat/firebase_options.dart';
import 'package:scroller_chat/screens/chat_screen.dart';
import 'package:scroller_chat/screens/login_screen.dart';
import 'package:scroller_chat/screens/regester_screen.dart';
import 'package:scroller_chat/widgets/buble.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        ChatScreen.id: (context) => ChatScreen()
      },
      initialRoute: LoginScreen.id,
      
    ),
  );
}
