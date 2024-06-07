import 'package:flutter/material.dart';
void main() {
  runApp(const MaterialApp(home: StudentProfessor(),));
}

  class StudentProfessor extends StatelessWidget {
  const StudentProfessor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
         decoration: const BoxDecoration(color:  Color.fromARGB(255, 254, 196, 234)),

       )

  );
  }
  }
