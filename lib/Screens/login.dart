import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackxite/Screens/signup.dart';
import 'package:hackxite/controller/login.dart';
import 'package:hackxite/widgets/custom_btn.dart';
import 'package:hackxite/widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  AuthController authController = Get.find();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  

 
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 226, 226),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 150),
            const Text(
              'Welcome Back',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 70),
            CustomTextField(
              hint: 'Email',
              obscureText: false,
              color: Colors.white.withOpacity(0.5),
              txtController: emailController,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              hint: 'Password',
              obscureText: true,
              color: Colors.white.withOpacity(0.5),
              txtController: passwordController,
            ),
            const SizedBox(height: 25),
            CustomBtn(
              btntext: 'Sign in',
              onpressed: () async {
               

                try {
                  if (passwordController.text.isEmpty ||
                      emailController.text.isEmpty) {
                    Get.snackbar(
                      'Error',
                      'Field is empty',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  } else {
                    authController
                        .signIn(emailController.text, passwordController.text,
                            context)
                        .then(
                      (value) {
                        emailController.clear();
                        passwordController.clear();
                      },
                    );
                  }
                } catch (e) {
                  Get.snackbar(
                    'Error',
                    'please try again later',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Not a member?',
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Register now',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
