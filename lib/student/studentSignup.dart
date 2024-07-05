import 'dart:io';
import 'package:flutter/material.dart';
import 'package:approjectfront/student/studentInfo.dart';
import 'package:approjectfront/student/studentLogin.dart';

class StudentSignUp extends StatefulWidget {
  const StudentSignUp({super.key});

  @override
  _StudentSignUpState createState() => _StudentSignUpState();
}

class _StudentSignUpState extends State<StudentSignUp> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController studentID = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscure = true;
  String passwordError = '';
  String errorMessage = '';

  bool isValidPassword(String password, String studentID) {
    passwordError = ''; // Reset error message
    String pattern = r'^(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(password)) {
      passwordError = 'Password must be at least 8 characters long,\n      include a capital letter, and a number.';
      return false;
    }
    if (password.contains(studentID)) {
      passwordError = 'Password should not contain the student ID.';
      return false;
    }
    return true;
  }


  bool validateFields() {
    if (firstName.text.isEmpty ||
        lastName.text.isEmpty ||
        studentID.text.isEmpty ||
        password.text.isEmpty) {
      errorMessage = 'Please fill in all fields.';
      return false;
    }
    return true;
  }

  Future<void> saveToTextFile(String studentID, String password) async {
    try {
      final serverSocket = await Socket.connect("192.168.147.204", 8080);
      serverSocket.write('POST: StudentSignUp~$studentID~$password\u0000');
      serverSocket.flush();
      await serverSocket.close();


      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const StudentInfoPage()),
      );
    } catch (e) {
      print("Error connecting to server: $e");

    }
  }

  @override
  Widget build(BuildContext context) {
    double heightOfScreen = MediaQuery.of(context).size.height;
    double widthOfScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Sign Up',
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
              left: widthOfScreen * 0.21,
              child: SizedBox(
                child: Image.asset('images/stud.png'),
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
                    labelText: 'Student ID',
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
                    hintText: 'Enter your student ID',
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
                left: widthOfScreen * 0.185,
                top: heightOfScreen * 0.74, // Adjust the vertical position as needed
                child: Text(
                  passwordError.isNotEmpty ? passwordError : '',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontFamily: 'chunck',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),

            Positioned(
              left: widthOfScreen * 0.32,
              top: heightOfScreen * 0.74,
              child: errorMessage.isNotEmpty
                  ? Text(
                errorMessage,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontFamily: 'chunck',
                  fontWeight: FontWeight.w300,
                ),
              )
                  : SizedBox(),
            ),
            Positioned(
              right: widthOfScreen * 0.15,
              top: heightOfScreen * 0.68,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    errorMessage = validateFields() ? '' : 'Please fill in all fields !!!';
                    passwordError = ''; // Reset password error message
                    if (errorMessage.isEmpty && isValidPassword(password.text, studentID.text)) {
                      saveToTextFile(studentID.text, password.text);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StudentInfoPage(),
                        ),
                      );
                    }
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  ),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
                      builder: (context) => const StudentLogin(),
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
          ],
        ),
      ),
    );
  }
}
