import 'package:flutter/material.dart';

class SeePhoneNumber extends StatefulWidget {
  const SeePhoneNumber({super.key});

  @override
  State<SeePhoneNumber> createState() => _SeePhoneNumberState();
}

class _SeePhoneNumberState extends State<SeePhoneNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.white,
      title: const Text(
        "See your phone number",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    ));
  }
}
