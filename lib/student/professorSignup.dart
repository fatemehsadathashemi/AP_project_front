import 'package:approjectfront/student/professorLogin.dart';
import 'package:flutter/material.dart';

class ProfessorSignUp extends StatefulWidget {
  const ProfessorSignUp({Key? key}) : super(key: key);

  @override
  _ProfessorSignUpState createState() => _ProfessorSignUpState();
}

class _ProfessorSignUpState extends State<ProfessorSignUp> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController studentID = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    double heightOfScreen = MediaQuery.of(context).size.height;
    double widthOfScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Professor Sign Up',
          style: TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 24,
            fontWeight: FontWeight.w700,
            fontFamily: 'merich',
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: const Color.fromARGB(245, 239, 176, 216),
        shadowColor: const Color.fromARGB(100, 51, 22, 50),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 254, 196, 234),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              height: heightOfScreen * 0.33,
              width: widthOfScreen * 0.60,
              top: heightOfScreen * 0.045,
              left: widthOfScreen * 0.37,
              child: SizedBox(
                child: Image.asset('images/profe.png'),
              ),
            ),
            Positioned(
              left: widthOfScreen * 0.15,
              top: heightOfScreen * 0.4,
              child: SizedBox(
                width: widthOfScreen * 0.7,
                child: TextFormField(
                  controller: firstName,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white60,
                    labelText: 'First Name',
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 24, 21, 66),
                      fontSize: 23,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'chunck',
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 24, 21, 66),
                      ),
                    ),
                    hintText: 'Enter your first name',
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 24, 21, 66),
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.purple.shade100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 24, 21, 66),
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: widthOfScreen * 0.15,
              top: heightOfScreen * 0.47,
              child: SizedBox(
                width: widthOfScreen * 0.7,
                child: TextFormField(
                  controller: lastName,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white60,
                    labelText: 'Last Name',
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 24, 21, 66),
                      fontSize: 23,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'chunck',
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 24, 21, 66),
                      ),
                    ),
                    hintText: 'Enter your last name',
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 24, 21, 66),
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.purple.shade100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 24, 21, 66),
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: widthOfScreen * 0.15,
              top: heightOfScreen * 0.54,
              child: SizedBox(
                width: widthOfScreen * 0.7,
                child: TextFormField(
                  controller: studentID,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white60,
                    labelText: 'Professor ID',
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 24, 21, 66),
                      fontSize: 23,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'chunck',
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 24, 21, 66),
                      ),
                    ),
                    hintText: 'Enter your Professor ID',
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 24, 21, 66),
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.purple.shade100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 24, 21, 66),
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: widthOfScreen * 0.15,
              top: heightOfScreen * 0.61,
              child: SizedBox(
                width: widthOfScreen * 0.7,
                child: TextFormField(
                  controller: password,
                  obscureText: obscure,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white60,
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 24, 21, 66),
                      fontSize: 23,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'chunck',
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 24, 21, 66),
                      ),
                    ),
                    hintText: 'Enter your password',
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 24, 21, 66),
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscure ? Icons.visibility : Icons.visibility_off,
                        color: const Color.fromARGB(255, 24, 21, 66),
                      ),
                      onPressed: () {
                        setState(() {
                          obscure = !obscure;
                        });
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.purple.shade100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 24, 21, 66),
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: heightOfScreen * 0.68,
              left: widthOfScreen * 0.15,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfessorLogin(),
                    ),
                  );
                },
                child: const Text(
                    "Already have an account? Login",
                    style: TextStyle(
                    color: Color.fromARGB(255, 24, 21, 66),
                    fontFamily: 'chunck',
                    fontSize: 21,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ),
            Positioned(
              top: heightOfScreen * 0.68,
              right: widthOfScreen * 0.15,
              child: GestureDetector(
                onTap: () {

                },
                child: Container(
                  height: 50,
                  width:120,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
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