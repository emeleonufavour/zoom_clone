import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:zoom_clone/services/auth_service.dart';
import 'package:zoom_clone/utils/utilities.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent[700],
      ),
      body: SafeArea(
        child: Stack(children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.blueAccent[700],
            padding: const EdgeInsets.only(top: 250),
            child: Align(
              alignment: Alignment.topCenter,
              child: SvgPicture.asset(
                'assets/zoom.svg',
                color: Colors.white,
                height: 50,
              ),
            ),
          ),
          //box at the bottom of landing page
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              height: MediaQuery.of(context).size.height * (1 / 3),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              //contents of the box
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //details of the box
                  const Text(
                    "Welcome",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Get started with your account",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //join a meeting
                  AuthBox(
                    placeHolder: 'Join a Meeting',
                    onPressed: () {},
                    coloured: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //sign up
                  AuthBox(placeHolder: 'Sign Up', onPressed: () {}),
                  const SizedBox(
                    height: 10,
                  ),
                  //sign in
                  AuthBox(
                    placeHolder: 'Sign In',
                    onPressed: () async {
                      bool success =
                          await _authService.signInWithGoogle(context);
                      print("it is was $success");
                      if (success) {
                        Navigator.of(context).pushNamed('/home');
                      }
                    },
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
