import 'package:cours_01/res/colors.dart';
import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({this.onPressed, super.key});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: onPressed, child: Text('Continue'));
  }
}

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    this.onPressed,
    required this.text,
    required this.image,
    super.key,
  });
  final VoidCallback? onPressed;
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Row(children: <Widget>[Image.asset(image), Text(text)]),
    );
  }
}

class TextFieldEmail extends StatelessWidget {
  const TextFieldEmail({required this.text, required this.image, super.key});

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        autofocus: false,
        decoration: InputDecoration(
          icon: const Icon(Icons.email_outlined),
          label: Text(text),
          hintText: 'ronanmeyergo@gmail.com',
          hintStyle: const TextStyle(color: AppColors.textSecondary),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.inputFieldInactiveBackground,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.inputFieldActiveBackground),
          ),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Log in or Sign up',
          style: TextStyle(
            color: AppColors.textPrimary,
            height: 5,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          TextFieldEmail(text: 'Email Address', image: 'mail-image-icon.svg'),
          ContinueButton(onPressed: () {}),
          GoogleButton(
            onPressed: () {},
            text: 'Continue with Google',
            image: 'google_logo.svg',
          ),
        ],
      ),
    );
  }
}
