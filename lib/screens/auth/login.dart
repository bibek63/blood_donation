import 'package:blood_donation/controller/auth_controller.dart';
import 'package:blood_donation/screens/auth/registration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Log In",
            style: TextStyle(
              color: containerColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          )),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      //name

                      TextFormField(
                        controller: emailController,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: borderColor,
                            )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: borderColor)),
                            label: const Text(
                              "Email",
                              style: TextStyle(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: borderColor))),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      //email
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: borderColor,
                            )),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: borderColor)),
                            label: const Text(
                              "Password",
                              style: TextStyle(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: borderColor))),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      //password
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(containerColor)),
                  onPressed: () => AuthController()
                      .loginUser(emailController.text, passwordController.text),
                  child: const Text("Login"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 17),
                    ),
                    TextButton(
                        onPressed: (() => Get.to(() => RegistrationScreen())),
                        child: const Text(
                          "Register",
                          style: TextStyle(fontSize: 17),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
