import 'package:flutter/material.dart';

import '../components/text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 44, 52),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/scholar.png',
                    width: 100,
                    height: 100,
                  ),
                  const Text(
                    'Scroller Chat',
                    style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 24,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            const Text(
              'Login',
              style: TextStyle(
                  fontFamily: 'Pacifico', fontSize: 24, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomTextField(
              hintText: 'Emaill',
              icon: Icon(
                Icons.email,
                color: Color.fromARGB(255, 161, 161, 161),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
