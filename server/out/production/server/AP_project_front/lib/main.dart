import 'package:approjectfront/student/Studentprofessor.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: WelcomePage(),
  debugShowCheckedModeBanner: false,));
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

Route _createRoute(){
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => StudentProfessor(),
    transitionsBuilder: (context, animation, secondaryAnimation, child){
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.easeInOut;
        var tween = Tween(begin: begin , end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
            position: offsetAnimation,child: child);
    }
  );
}

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
          children: <Widget> [
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(_createRoute());
              },
            ),
            Positioned(
              left: 60,
              top: 60,
              child: Text(
              "Welcome to" ,
                style: TextStyle(
                color: Color.fromARGB(255, 24, 21, 66) ,
                fontSize: 40,
                fontWeight: FontWeight.w200,
                fontFamily: 'merich',
            ),
            )),
            Positioned(
              left: 150,
              top: 95,
              child: Text(
                "UniHub",
                style: TextStyle(
                  color: Color.fromARGB(255, 24, 21, 66) ,
                  fontSize: 66,
                  fontWeight: FontWeight.w900 ,
                  fontFamily: 'merich',
                  fontStyle: FontStyle.italic,
                ),
              )),
            Positioned(
              right: 0,
              bottom: 0,
              height: 520,
              width: 400,
              child: SizedBox(child: Image.asset('images/welcome2.png' , fit:BoxFit.fill,)
            )),

          ],
        ),
      )
    );
  }
}
