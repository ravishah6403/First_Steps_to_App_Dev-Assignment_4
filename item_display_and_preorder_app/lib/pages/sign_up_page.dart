// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:item_display_and_preorder_app/services/auth_service.dart';
import 'package:item_display_and_preorder_app/widgets/button_custom.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:item_display_and_preorder_app/widgets/constants/color_constants.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  var _password = '';
  var _confirmPassword = '';

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  void signUp() async {
    if (_formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(child: CircularProgressIndicator());
          });
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);
        Navigator.popUntil(context, ModalRoute.withName('/'));
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        Fluttertoast.showToast(msg: '${e.message}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_rounded)),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Create Account',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(height: 40),
                Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(children: [
                        TextFormField(
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_outline_rounded,
                                color: Colors.grey.shade400,
                              ),
                              hintText: 'FULL NAME',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400))),
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: _emailController,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email cannot be empty';
                            }
                            return validateEmail(value);
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.mail_outline_rounded,
                                color: Colors.grey.shade400,
                              ),
                              hintText: 'EMAIL',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400))),
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          onChanged: (value) {
                            _password = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password cannot be empty';
                            } else if (value.length < 6) {
                              return 'Password must be atleat 6 character';
                            }
                            return null;
                          },
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outline_rounded,
                                color: Colors.grey.shade400,
                              ),
                              hintText: 'PASSWORD',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400))),
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: false,
                          onChanged: (value) {
                            _confirmPassword = value;
                          },
                          validator: (value) {
                            if (_confirmPassword != _password) {
                              return 'Does not match password';
                            }
                            return null;
                          },
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock_outline_rounded,
                                color: Colors.grey.shade400,
                              ),
                              hintText: 'CONFIRM PASSWORD',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400))),
                        ),
                        const SizedBox(height: 40),
                        ButtonCustom(
                          text: 'SIGN UP',
                          function: signUp,
                        ),
                      ]),
                    )),
                const SizedBox(height: 30),
                const Center(
                    child: Text(
                  'Or continue with',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500),
                )),
                const SizedBox(height: 10),
                Center(
                    child: SizedBox(
                  width: 50,
                  height: 50,
                  child: IconButton.outlined(
                      onPressed: () => {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }),
                            AuthService().signInWithGoogle(),
                            Navigator.popAndPushNamed(context, '/')
                          },
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.grey.shade400)),
                      icon: Image.asset('assets/imgs/google_logo.png')),
                )),
                const Spacer(),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.bold),
                      ))
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
