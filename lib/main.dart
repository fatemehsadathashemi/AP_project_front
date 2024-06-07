import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: WelcomePage(),));
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color:  Color.fromARGB(255, 254, 196, 234)),
        child:  Stack(
          children: <Widget> [
            Positioned(
              left: 60,
              top: 120,
              child: Text(
              "Welcome to" ,
                style: TextStyle(
                color: Color.fromARGB(255, 24, 21, 66) ,
                fontSize: 40,
                fontWeight: FontWeight.w900 ,
                fontStyle: FontStyle.italic ,
            ),
            )),
            Positioned(
              left: 150,
              top: 155,
              child: Text(
                "UniHub",
                style: TextStyle(
                  color: Color.fromARGB(255, 24, 21, 66) ,
                  fontSize: 60,
                  fontWeight: FontWeight.w900 ,
                  fontStyle: FontStyle.italic ,
                ),
              )),
            Positioned(
              left: 0,
              bottom: 0,
              child: SizedBox(child: Image.asset('images/welcome2.jpeg' , fit:BoxFit.fill,)
            )),
          ],
        ),

      )


    );
  }
}
