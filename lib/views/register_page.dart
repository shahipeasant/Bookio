import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_page.dart';

class RegisterPage extends StatelessWidget{
  const RegisterPage({super.key});

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
                  hintText: 'Username',
                ),
              ),
            ),
            SizedBox(height: 30),
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
    );
  }
}