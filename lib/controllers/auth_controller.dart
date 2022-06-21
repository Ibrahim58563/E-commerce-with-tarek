import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_tarek/services/auth.dart';
import 'package:flutter_ecommerce_tarek/utilities/enums.dart';

class AuthController with ChangeNotifier {
  final AuthBase auth;
  String email;
  String password;
  AuthFormType authFormType;

  AuthController({
    required this.auth,
    this.email = '',
    this.password = '',
    this.authFormType = AuthFormType.login,
  });

  Future<void> submit() async {
    try {
      if (authFormType == AuthFormType.login) {
        await auth.signUpWithEmailAndPassword(email, password);
      } else {
        await auth.signUpWithEmailAndPassword(email, password);
      }
    } catch (e) {
      rethrow;
    }
  }

  void toggleFormType() {
    final formType = this.authFormType == AuthFormType.login
        ? AuthFormType.register
        : AuthFormType.login;
    copyWiht(
      email: '',
      password: '',
      authFormType: formType,
    );
  }

  void updateEmail(String email) => copyWiht(email: email);
  void updatePassword(String password) => copyWiht(password: password);

  void copyWiht({
    String? email,
    String? password,
    AuthFormType? authFormType,
  }) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.authFormType = authFormType ?? this.authFormType;
    notifyListeners();
  }
}
