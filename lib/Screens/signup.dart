import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackxite/controller/adduser.dart';
import 'package:hackxite/controller/login.dart';
import 'package:hackxite/widgets/custom_btn.dart';
import 'package:hackxite/widgets/custom_textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController1 = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myFocusNode.addListener(() {
    if (myFocusNode.hasFocus) {
      print("TextField got the focus");
    } else {
      print("TextField lost the focus");
    }
  });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
   myFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    AddUserData userData = Get.find();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 226, 226),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 200),
            Text(
              'Create Account',
              style: TextStyle(fontSize: 25, color: Colors.grey.shade700),
            ),
            const SizedBox(height: 20),
            CustomTextField(
                obscureText: false,
                txtController: emailController1,
                hint: 'Email',
                color: Colors.white.withOpacity(0.3)),
            const SizedBox(height: 15),
            CustomTextField(
                obscureText: true,
                txtController: passwordController1,
                hint: 'Password',
                color: Colors.white.withOpacity(0.3)),
            const SizedBox(height: 15),
            CustomTextField(
                obscureText: true,
                txtController: passwordController2,
                hint: 'Confirm Password',
                color: Colors.white.withOpacity(0.3)),
            const SizedBox(height: 30),
            CustomBtn(
              btntext: 'Sign Up',
              onpressed: () {
                if (passwordController1.text != passwordController2.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Passwords doesnt match')));
                }
                if (passwordController1.text.length < 6 ||
                    passwordController2.text.length < 6) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Password should be atleast 6'),
                    ),
                  );
                }

                if (passwordController1.text == passwordController2.text) {
                  authController
                      .signUp(emailController1.text, passwordController1.text)
                      .then(
                    (_) {
                      userData.addUserData(
                          emailController1.text,
                          passwordController1.text,
                          FirebaseAuth.instance.currentUser!.uid.toString());
                      emailController1.clear();
                      passwordController1.clear();
                      passwordController2.clear();
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/home', (route) => false);
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
