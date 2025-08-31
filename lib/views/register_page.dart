import 'package:bookio/controllers/auth_controller.dart';
import 'package:bookio/views/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_page.dart';

class RegisterPage extends StatefulWidget{
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final AuthController auth = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
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
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                  value == null || value.isEmpty ? "Enter username" : null,
                ),
              ),
              SizedBox(height: 12),
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
                  obscureText: true,
                  validator: (value) =>
                  value != null && value.length < 6 ? "Password too short" : null,
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        await AuthController.to.register(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                        );
                        await AuthController.to.updateUsername(
                          username: usernameController.text.trim(),
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
                child: Text('Register'),
              ),
              SizedBox(height: 7),
              Text("Already have an account?"),
              GestureDetector(
                onTap: (){
                  Get.to(() => LoginPage());
                },
                child: Text("Login now", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}