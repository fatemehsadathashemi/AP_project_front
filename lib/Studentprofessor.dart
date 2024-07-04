import 'package:flutter/material.dart';
import 'package:approjectfront/student/studentLogin.dart';
import 'package:approjectfront/professor/professorLogin.dart';

class StudentProfessor extends StatefulWidget {
  const StudentProfessor({Key? key}) : super(key: key);

  @override
  _StudentProfessorState createState() => _StudentProfessorState();
}

class _StudentProfessorState extends State<StudentProfessor> {
  bool _isStudentSelected = false;
  bool _isProfessorSelected = false;

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

  void _onStudentClick(BuildContext context) {
    setState(() {
      _isStudentSelected = true;
      _isProfessorSelected = false;
    });
    Navigator.of(context).push(_createRoute(StudentLogin()));
  }

  void _onProfessorClick(BuildContext context) {
    setState(() {
      _isStudentSelected = false;
      _isProfessorSelected = true;
    });
    Navigator.of(context).push(_createRoute(ProfessorLogin()));
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
              child: GestureDetector(
                onTap: () => _onStudentClick(context),
                child: Container(
                  decoration: BoxDecoration(
                    border: _isStudentSelected
                        ? Border.all(color: Colors.purple, width: 2.0)
                        : null,
                  ),
                  child: Image.asset('images/students.png'),
                ),
              ),
            ),
            Positioned(
              right: widthOfScreen * 0.055,
              bottom: heightOfScreen * 0.435,
              height: heightOfScreen * 0.23,
              width: widthOfScreen * 0.44,
              child: GestureDetector(
                onTap: () => _onProfessorClick(context),
                child: Container(
                  decoration: BoxDecoration(
                    border: _isProfessorSelected
                        ? Border.all(color: Colors.purple, width: 2.0)
                        : null,
                  ),
                  child: Image.asset('images/professors.png'),
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
