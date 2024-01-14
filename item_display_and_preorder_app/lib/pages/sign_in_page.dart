// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:item_display_and_preorder_app/services/auth_service.dart';
import 'package:item_display_and_preorder_app/widgets/button_custom.dart';
import 'package:item_display_and_preorder_app/widgets/constants/color_constants.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPassVisible = false;

  final _formKey = GlobalKey<FormState>();

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

  void signIn() async {
    if (_formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return const Center(child: CircularProgressIndicator());
          });
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        switch (e.code) {
          case "invalid-credential":
            Fluttertoast.showToast(msg: 'Invalid Credentials');
            break;
          default:
            Fluttertoast.showToast(msg: e.code);
        }
        debugPrint('Error Code: ${e.code}');
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    const Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      'Please sign in to continue',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 50),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade400))),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: !_isPassVisible,
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
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isPassVisible = !_isPassVisible;
                                  });
                                },
                                icon: _isPassVisible
                                    ? const Icon(Icons.visibility_off_rounded)
                                    : const Icon(Icons.visibility_rounded),
                                color: Colors.grey.shade400,
                              ),
                              hintText: 'PASSWORD',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400)),
                            ),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/forgotPass'),
                            child: const Text(
                              'FORGOT',
                              style: TextStyle(
                                  color: AppColors.secondary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          ButtonCustom(
                            text: 'LOGIN',
                            function: signIn,
                          ),
                        ],
                      ),
                    ),
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
                                Navigator.pop(context)
                              },
                          style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.grey.shade400)),
                          icon: Image.asset('assets/imgs/google_logo.png')),
                    )),
                    const Spacer(),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text(
                        '''Don't have an account?''',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/signUp'),
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                                color: AppColors.secondary,
                                fontWeight: FontWeight.bold),
                          ))
                    ]),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
