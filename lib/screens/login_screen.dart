import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scroller_chat/constants.dart';
import 'package:scroller_chat/components/text.dart';
import 'package:scroller_chat/screens/chat_screen.dart';

import '../components/text_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  static String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  String? email;

  String? password;

  bool isLoading = false;

  @override
  Widget build(context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
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
                      fontFamily: 'Pacifico',
                      fontSize: 24,
                      color: Colors.white),
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
                CustomTextField(
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'Email',
                  icon: const Icon(
                    Icons.email,
                    color: Color.fromARGB(255, 161, 161, 161),
                  ),
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  onChanged: (data) {
                    password = data;
                  },
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
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});

                      try {
                        var auth = FirebaseAuth.instance;
                        UserCredential userCredential =
                            await auth.signInWithEmailAndPassword(
                                email: email!, password: password!);
                        showSnackBar(context, 'success');
                        Navigator.pushNamed(context, ChatScreen.id);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackBar(context, 'invalid email');
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(context, 'wrong Password');
                        }
                      } catch (ex) {
                        //showSnackBar(context, ex.toString());
                      }
                      isLoading = false;
                      setState(() {});
                    }
                  },
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
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }
}
