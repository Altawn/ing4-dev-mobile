import 'package:cours_01/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({this.onPressed, super.key});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: onPressed, child: Text('Continue'));
  }
}

class BrandedButton extends StatelessWidget {
  const BrandedButton({
    required this.text,
    required this.image,
    this.onPressed,
    super.key,
  });
  final VoidCallback? onPressed;
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Row(
        children: <Widget>[
          SvgPicture.asset(image, height: 20, width: 20),
          Text(text),
        ],
      ),
    );
  }
}

class TextFieldEmail extends StatelessWidget {
  const TextFieldEmail({
    required this.text,
    required this.image,
    this.onChanged,
    super.key,
  });

  final String text;
  final String image;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        onChanged: onChanged,
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

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';

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
          TextFieldEmail(
            text: 'Email Address',
            image: 'mail-image-icon.svg',
            onChanged: (value) {
              setState(() {
                _email = value;
              });
            },
          ),
          ContinueButton(onPressed: () {}),
          BrandedButton(
            onPressed: () {},
            text: 'Continue with Google',
            image: 'assets/google_logo.svg',
          ),
          BrandedButton(
            onPressed: () {},
            text: 'Continue with Facebook',
            image: 'assets/facebook_logo.svg',
          ),
          BrandedButton(
            onPressed: () {},
            text: 'Continue with Apple',
            image: 'assets/apple_logo.svg',
          ),
          FilledButton(
            onPressed: _email.isNotEmpty ? () {} : null,
            style: FilledButton.styleFrom(
              foregroundColor: AppColors.buttonPrimaryText,
              backgroundColor: AppColors.buttonPrimaryBackground,
            ),
            child: const Text('Continue'),
          ),
        ],
      ),
    );
  }
}
