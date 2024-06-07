import 'package:flutter/material.dart';
void main() {
  runApp(const MaterialApp(home: ProfessorLogin(),
    debugShowCheckedModeBanner: false,));
}

class ProfessorLogin extends StatelessWidget {
  const ProfessorLogin({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Professor Page'),
      ),
      body: const Center(
        child: Text('Welcome Professor!'),
      ),
    );
  }
}