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
              left: widthOfScreen * 0.09,
              top: heightOfScreen * 0.065,
              child: const Text(
                "Welcome to",
                style: TextStyle(
                  color: Color.fromARGB(255, 24, 21, 66),
                  fontSize: 57,
                  fontWeight: FontWeight.w200,
                  fontFamily: 'merich',
                ),
              ),
            ),
            Positioned(
              left: widthOfScreen * 0.28,
              top: heightOfScreen * 0.12,
              child: const Text(
                "UniHub",
                style: TextStyle(
                  color: Color.fromARGB(255, 24, 21, 66),
                  fontSize: 84,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'merich',
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              height: heightOfScreen * 0.7,
              width: widthOfScreen ,
              child: SizedBox(
                child: Image.asset(
                  'images/ss.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: heightOfScreen * 0.2,
              right: widthOfScreen * 0.05,
              child:  ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(_createRoute());
                } ,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(widthOfScreen * 0.18, heightOfScreen * 0.035),
                  side: BorderSide(width: 1.0 , color:Colors.purple.shade600  , )
                ),

                child: Text(
                  'Continue',
                   style: TextStyle(
                     color: Colors.purple.shade600,
                     fontWeight: FontWeight.w500,
                     fontSize: 14,
                     fontFamily: 'chunck',
                ),
              ),
            ),
            )
          ],
        ),
      ),
    );
  }
}
