import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scroller_chat/components/text.dart';
import 'package:scroller_chat/components/text_field.dart';
import 'package:scroller_chat/constants.dart';
import 'package:scroller_chat/helper/show_snackbar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
  });
  static String id = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  String? email;

  String? passward;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 46, 66, 85),
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
                  kLogo,
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
                      text: 'Register',
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
                    passward = data;
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
                        await userRegister();
                        Navigator.pop(context);
                        showSnackBar(context, 'Succsess!');
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'weak-password') {
                          showSnackBar(context, 'weak password');
                        } else if (ex.code == 'email-already-in-use') {
                          showSnackBar(context, 'email already exist!');
                        }
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
                            text: 'Sign up',
                            size: 20,
                            color: Color.fromARGB(255, 50, 56, 55))),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                      text: 'already have an account?',
                      size: 15,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const CustomText(
                        text: 'Sign in',
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

  Future<void> userRegister() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!, password: passward!);
  }
}
