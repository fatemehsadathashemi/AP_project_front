import 'package:approjectfront/student/professorLogin.dart';
import 'package:approjectfront/student/studentLogin.dart';
import 'package:flutter/material.dart';

class StudentProfessor extends StatefulWidget {
  const StudentProfessor({super.key});

  @override
  _StudentProfessorState createState() => _StudentProfessorState();
}

class _StudentProfessorState extends State<StudentProfessor> {
  bool _isHoveringStudent = false;
  bool _isHoveringProfessor = false;

  void _onStudentClick() {
    Navigator.push(
      context,
      _createRoute( StudentLogin()),
    );
  }

  void _onProfessorClick() {
    Navigator.push(
      context,
      _createRoute(const ProfessorLogin()),
    );
  }

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(245, 239, 176, 216),
        shadowColor: const Color.fromARGB(100, 51, 22, 50),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 254, 196, 234)),
        child: Stack(
          children: <Widget>[
            const Positioned(
              top: 95,
              left: 133,
              child: Text(
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
              left: 40,
              bottom: 600,
              height: 250,
              width: 300,
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
              right: 40,
              bottom: 600,
              height: 250,
              width: 300,
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
