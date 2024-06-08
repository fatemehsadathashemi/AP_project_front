import 'package:flutter/material.dart';
import 'package:approjectfront/student/Studentprofessor.dart';

void main() {
  runApp(const MaterialApp(
    home: WelcomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => StudentProfessor(),
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
              left: widthOfScreen * 0.13,
              top: heightOfScreen * 0.07,
              child: const Text(
                "Welcome to",
                style: TextStyle(
                  color: Color.fromARGB(255, 24, 21, 66),
                  fontSize: 55,
                  fontWeight: FontWeight.w200,
                  fontFamily: 'merich',
                ),
              ),
            ),
            Positioned(
              left: widthOfScreen * 0.33,
              top: heightOfScreen * 0.125,
              child: const Text(
                "UniHub",
                style: TextStyle(
                  color: Color.fromARGB(255, 24, 21, 66),
                  fontSize: 82,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'merich',
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Positioned(
              left: widthOfScreen * 0.38,
              bottom: 0,
              height: heightOfScreen * 0.64,
              width: widthOfScreen * 0.7,
              child: SizedBox(
                child: Image.asset(
                  'images/welcome2.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: heightOfScreen * 0.155,
              right: widthOfScreen * 0.05,
              child: ElevatedButtonWithHover(
                onPressed: () {
                  Navigator.of(context).push(_createRoute());
                },
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class ElevatedButtonWithHover extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;

  const ElevatedButtonWithHover({Key? key, required this.onPressed, required this.child}) : super(key: key);

  @override
  _ElevatedButtonWithHoverState createState() => _ElevatedButtonWithHoverState();
}

class _ElevatedButtonWithHoverState extends State<ElevatedButtonWithHover> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (states) {
              if (states.contains(MaterialState.hovered)) {
                return Colors.purple;
              }
              return Colors.white;
            },
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(16)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Adjust the radius as needed
              side: const BorderSide(color: Colors.purple),
            ),
          ),
        ),
        child: DefaultTextStyle(
          style: TextStyle(
            color: _isHovered ? Colors.white : Colors.purple,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
