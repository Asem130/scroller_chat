import 'package:flutter/material.dart';
import 'package:scroller_chat/constants.dart';
import 'package:scroller_chat/components/text.dart';

import '../components/text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static String id = 'LoginScreen';
  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            Image.asset(
              'assets/images/scholar.png',
            ),
            const Text(
              'Scroller Chat',
              style: TextStyle(
                  fontFamily: 'Pacifico', fontSize: 24, color: Colors.white),
            ),
            const Spacer(
              flex: 2,
            ),
            const Row(
              children: [
                CustomText(
                  text: 'Login',
                  size: 24,
                  color: Colors.white,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomTextField(
              hintText: 'Email',
              icon: Icon(
                Icons.email,
                color: Color.fromARGB(255, 161, 161, 161),
              ),
            ),
            const SizedBox(height: 15),
            CustomTextField(
              hintText: 'passward',
              icon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.visibility_off,
                  color: Color.fromARGB(255, 161, 161, 161),
                ),
              ),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                    child: CustomText(
                        text: 'Sign in',
                        size: 20,
                        color: Color.fromARGB(255, 50, 56, 55))),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  text: 'don\'t have an account?',
                  size: 15,
                  color: Colors.white,
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'RegisterScreen');
                  },
                  child: const CustomText(
                    text: 'REGISTER',
                    size: 15,
                    color: Color(0xffC7EDE6),
                  ),
                ),
              ],
            ),
            const Spacer(
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }
}
