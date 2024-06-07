import 'package:flutter/material.dart';
void main() {
  runApp(const MaterialApp(home: StudentProfessor(),
  debugShowCheckedModeBanner: false,));
}

  class StudentProfessor extends StatelessWidget {
  const StudentProfessor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          backgroundColor: const Color.fromARGB(245, 239, 176, 216),
          shadowColor: const Color.fromARGB(100, 51, 22, 50) ,
       ),
       body: Container(
         decoration: const BoxDecoration(color:  Color.fromARGB(255, 254, 196, 234)),
         child:  Stack(
           children:<Widget> [
             Positioned(
               top: 75,
               left: 85,
               child: Text(
                 "              are you \n Student or Professor? " ,
                 style: TextStyle(
                   color: Color.fromARGB(255, 24, 21, 66) ,
                   fontSize: 30,
                   fontWeight: FontWeight.w700,
                   fontFamily: 'chunck',
                 ),
               )
             ),
             Positioned(
                 top: 190,
                 left: 40,
                 child: Image.asset('images/students.png'))
           ],
         ),

       )

  );
  }
  }
