import 'package:bookio/views/register_page.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';


class AuthWrapper extends StatefulWidget {
  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool showLogin = true;
  void toggle() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("AuthWrapper: showLogin=$showLogin");
    return showLogin
        ? LoginPage(onSwitch: toggle)
        : RegisterPage(onSwitch: toggle);
  }
}