import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_tarek/controllers/auth_controller.dart';
import 'package:flutter_ecommerce_tarek/services/auth.dart';
import 'package:flutter_ecommerce_tarek/utilities/enums.dart';
import 'package:flutter_ecommerce_tarek/utilities/routes.dart';
import 'package:flutter_ecommerce_tarek/views/widgets/main_button.dart';
import 'package:provider/provider.dart';

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
  // var _authType = AuthFormType.login;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit(AuthController model) async {
    try {
      await model.submit();
      if (!mounted) return;
      Navigator.of(context).pushNamed(AppRoutes.bottomNavBarRoute);
    } catch (e) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(
            'Error',
            style: Theme.of(context).textTheme.headline5,
          ),
          content: Text(
            e.toString(),
            style: Theme.of(context).textTheme.subtitle1,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final auth = Provider.of<AuthBase>(context);
    return Consumer<AuthController>(
      builder: (_, model, __) {
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
                        model.authFormType == AuthFormType.login
                            ? "Login"
                            : "Register",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(
                        height: 100.0,
                      ),
                      TextFormField(
                        controller: _emailController,
                        focusNode: _emailFocusNode,
                        onChanged: model.updateEmail,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_passwordFocusNode),
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
                        obscureText: true,
                        onChanged: model.updatePassword,
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
                      if (model.authFormType == AuthFormType.login)
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
                        text: model.authFormType == AuthFormType.login
                            ? "Login"
                            : "Register",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _submit(model);
                          }
                        },
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                            child: Text(
                                (model.authFormType == AuthFormType.login)
                                    ? 'Don\'t have an account? Register'
                                    : 'Have an account? Login'),
                            onTap: () {
                              _formKey.currentState!.reset();
                              setState(() {
                                model.toggleFormType();
                              });
                            }),
                      ),
                      SizedBox(height: size.height * 0.15),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          model.authFormType == AuthFormType.login
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
      },
    );
  }
}
