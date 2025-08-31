import 'package:bookio/main.dart';
import 'package:bookio/views/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import 'homePage.dart';
import 'main_screen.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController auth = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4ebc3),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('lib/assets/book_stack.png'),
                height: 125,
                width: 125,
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                  value == null || value.isEmpty ? "Enter email" : null,
                ),
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                  value != null && value.length < 6 ? "Password too short" : null,
                  obscureText: true,
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        await AuthController.to.signIn(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                      } catch (e) {
                        Get.snackbar("Error", e.toString());
                      }
                    }
                  },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Color(0xffd4b200)),
                  textStyle: WidgetStateProperty.all(
                      TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        //color: Colors.white,
                      )
                  ),
                ),
                child: Text('Login'),
              ),
              SizedBox(height: 7),
              Text("Don't have an account?"),
              GestureDetector(
                onTap: (){
                  Get.to(() => RegisterPage());
                },
                child: Text("Register now", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}