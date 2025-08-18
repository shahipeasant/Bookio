import 'package:bookio/main.dart';
import 'package:bookio/views/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'homePage.dart';
import 'main_screen.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4ebc3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock,
              size: 60,
            ),
            SizedBox(height: 45),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Get.to(() => MainScreen());
                isLoggedIn = true;
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
    );
  }
}