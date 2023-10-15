import 'package:flutter/material.dart';

class SupportQuestions extends StatefulWidget {
  const SupportQuestions({super.key});

  @override
  State<SupportQuestions> createState() => _SupportQuestionsState();
}

class _SupportQuestionsState extends State<SupportQuestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Support Questions"),
        foregroundColor: Colors.black,
      ),
      body: const Center(
        child: Text(
          "How to recover your Account",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
