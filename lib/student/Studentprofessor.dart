import 'package:flutter/material.dart';
import 'package:approjectfront/student/studentLogin.dart';
import 'package:approjectfront/student/professorLogin.dart';

class StudentProfessor extends StatefulWidget {
  const StudentProfessor({Key? key}) : super(key: key);

  @override
  _StudentProfessorState createState() => _StudentProfessorState();
}

class _StudentProfessorState extends State<StudentProfessor> {
  bool _isHoveringStudent = false;
  bool _isHoveringProfessor = false;

  void _onStudentClick() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StudentLogin()),
    );
  }

  void _onProfessorClick() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfessorLogin()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double widthOfScreen = MediaQuery.of(context).size.width;
    double heightOfScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(245, 239, 176, 216),
        shadowColor: const Color.fromARGB(100, 51, 22, 50),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 254, 196, 234)),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: heightOfScreen * 0.075,
              left: widthOfScreen * 0.17,
              child: const Text(
                "             are you \n Student or Professor? ",
                style: TextStyle(
                  color: Color.fromARGB(255, 24, 21, 66),
                  fontSize: 45,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'chunck',
                ),
              ),
            ),
            Positioned(
              left: widthOfScreen * 0.055,
              bottom: heightOfScreen * 0.45,
              height: heightOfScreen * 0.2,
              width: widthOfScreen * 0.42,
              child: MouseRegion(
                onEnter: (_) => setState(() {
                  _isHoveringStudent = true;
                }),
                onExit: (_) => setState(() {
                  _isHoveringStudent = false;
                }),
                child: GestureDetector(
                  onTap: _onStudentClick,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    transform: _isHoveringStudent
                        ? (Matrix4.identity()
                      ..scale(1.1)
                      ..translate(-10, -10))
                        : Matrix4.identity(),
                    child: Image.asset('images/students.png'),
                  ),
                ),
              ),
            ),
            Positioned(
              right: widthOfScreen * 0.055,
              bottom: heightOfScreen * 0.435,
              height: heightOfScreen * 0.23,
              width: widthOfScreen * 0.44,
              child: MouseRegion(
                onEnter: (_) => setState(() {
                  _isHoveringProfessor = true;
                }),
                onExit: (_) => setState(() {
                  _isHoveringProfessor = false;
                }),
                child: GestureDetector(
                  onTap: _onProfessorClick,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    transform: _isHoveringProfessor
                        ? (Matrix4.identity()
                      ..scale(1.1)
                      ..translate(-10, -10))
                        : Matrix4.identity(),
                    child: Image.asset('images/professors.png'),
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 95,
              bottom: 500,
              child: SizedBox(
                width: 180,
                height: 50,
                child: Text(
                  "\"Student\"",
                  style: TextStyle(
                    color: Color.fromARGB(255, 24, 21, 66),
                    fontSize: 33,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'chunck',
                  ),
                ),
              ),
            ),
            const Positioned(
              right: 95,
              bottom: 500,
              child: SizedBox(
                width: 180,
                height: 50,
                child: Text(
                  "\"Professor\"",
                  style: TextStyle(
                    color: Color.fromARGB(255, 24, 21, 66),
                    fontSize: 33,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'chunck',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
