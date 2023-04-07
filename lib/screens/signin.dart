import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shopmk/main.dart';
import 'package:shopmk/screens/signup.dart';

import '../utils/utils.dart';
import 'dashboard.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Shop',
                    style: SafeGoogleFont('Rancho',
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                        color: Colors.black.withOpacity(0.6)),
                  ),
                  Text(
                    'MK',
                    style: SafeGoogleFont('Berkshire Swash',
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                        color: Colors.indigo.withOpacity(0.6)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Welcome back...',
                style: SafeGoogleFont('Poppins',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                    color: Colors.black.withOpacity(0.6)),
              ),
              Text(
                'Thanks for choosing us, please sign in again to regain access to the app',
                style: SafeGoogleFont('Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    height: 1.5,
                    color: Colors.black.withOpacity(0.6)),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.indigo.withOpacity(0.7)),
                  labelText: 'Email',
                  labelStyle: SafeGoogleFont('Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                      color: Colors.black.withOpacity(1)),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  errorStyle: TextStyle(
                    color: Colors.indigo.withOpacity(0.6),
                  ),
                  labelText: 'Password',
                  labelStyle: SafeGoogleFont('Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                      color: Colors.black.withOpacity(.7)),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Don\'t have an account yet? ',
                    style: SafeGoogleFont('Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                        color: Colors.black.withOpacity(0.6)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (const SignUpPage())),
                      );
                    },
                    child: Text(
                      'Create an account',
                      style: SafeGoogleFont('Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                          color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),

              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style: SafeGoogleFont('Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                        color: Colors.indigo.withOpacity(0.6)),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (const DashboardPage())),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.indigo.withOpacity(0.6)),
                  child: Text(
                    'Sign In',
                    style: SafeGoogleFont('Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                        color: Colors.white.withOpacity(1)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
