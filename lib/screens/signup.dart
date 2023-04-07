import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shopmk/screens/signin.dart';

import '../utils/utils.dart';
import 'dashboard.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
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
                'Thanks for choosing us...',
                style: SafeGoogleFont('Poppins',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                    color: Colors.black.withOpacity(0.6)),
              ),
              Text(
                'Fill in the details below to create an account and get started with us immediately',
                style: SafeGoogleFont('Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    height: 1.5,
                    color: Colors.black.withOpacity(0.6)),
              ),
              const SizedBox(height: 10),
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
              TextFormField(
                controller: _fullNameController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your Full Name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  errorStyle: TextStyle(color: Colors.indigo.withOpacity(0.7)),
                  labelText: 'Full Name',
                  labelStyle: SafeGoogleFont('Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                      color: Colors.black.withOpacity(1)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.grey.shade300),
                      child: Text('+234'),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: TextFormField(
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your mobile number';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        errorStyle:
                            TextStyle(color: Colors.indigo.withOpacity(0.7)),
                        labelText: 'Phone Number',
                        labelStyle: SafeGoogleFont('Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                            color: Colors.black.withOpacity(1)),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
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
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: TextFormField(
                      controller: _confirmPasswordController,
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
                        labelText: 'Confirm Password',
                        labelStyle: SafeGoogleFont('Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                            color: Colors.black.withOpacity(.7)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Already have an account? ',
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
                            builder: (context) => (const SignInPage())),
                      );
                    },
                    child: Text(
                      'Sign In',
                      style: SafeGoogleFont('Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                          color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => (DashboardPage())),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.indigo.withOpacity(0.6)),
                  child: Text(
                    'Sign Up',
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
