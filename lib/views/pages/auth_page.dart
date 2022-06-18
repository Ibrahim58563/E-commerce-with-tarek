import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_tarek/utilities/enums.dart';
import 'package:flutter_ecommerce_tarek/utilities/routes.dart';
import 'package:flutter_ecommerce_tarek/views/widgets/main_button.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  var _authType = AuthFormType.login;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _authType == AuthFormType.login ? "Login" : "Register",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(
                    height: 100.0,
                  ),
                  TextFormField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_passwordFocusNode),
                    textInputAction: TextInputAction.next,
                    validator: (val) =>
                        val!.isEmpty ? 'Please enter your email' : null,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter Your Email',
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    validator: (val) =>
                        val!.isEmpty ? 'Please enter your password' : null,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter Your Password',
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  if (_authType == AuthFormType.login)
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        child: const Text('Forget your password?'),
                        onTap: () {},
                      ),
                    ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  MainButton(
                    text:
                        _authType == AuthFormType.login ? "Login" : "Register",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context)
                            .pushNamed(AppRoutes.bottomNavBarRoute);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                        child: Text((_authType == AuthFormType.login)
                            ? 'Don\'t have an account? Register'
                            : 'Have an account? Login'),
                        onTap: () {
                          _formKey.currentState!.reset();
                          setState(() {
                            if (_authType == AuthFormType.login) {
                              _authType = AuthFormType.register;
                            } else {
                              _authType = AuthFormType.login;
                            }
                          });
                        }),
                  ),
                  SizedBox(height: size.height * 0.15),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      _authType == AuthFormType.login
                          ? "Or Login With"
                          : "Or Register With",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.white,
                        ),
                        child: const Icon(Icons.mail),
                      ),
                      const SizedBox(width: 16.0),
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.white,
                        ),
                        child: const Icon(Icons.facebook),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
