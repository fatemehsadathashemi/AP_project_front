import 'package:flutter/material.dart';
void main() {
  runApp(const MaterialApp(home: StudentLogin(),
    debugShowCheckedModeBanner: false,));
}

class StudentLogin extends StatelessWidget {
  const StudentLogin({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Page'),
      ),
      body: const Center(
        child: Text('Welcome Student!'),
      ),
    );
}
}