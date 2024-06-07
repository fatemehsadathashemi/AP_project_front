import 'package:approjectfront/student/InfoScreen.dart';
import 'package:flutter/material.dart';
void main() {
  runApp( MaterialApp(home: StudentLogin(),
    debugShowCheckedModeBanner: false,));
}

class StudentLogin extends StatefulWidget {
   StudentLogin({super.key});

  @override
  State<StudentLogin> createState() => _StudentLogin();
}
class _StudentLogin extends State<StudentLogin> {
  TextEditingController studentID = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscure = true, userIDChecker = true, passwordChecker = true;
  bool _isHovered = false; // Move the variable here


  @override
  Widget build(BuildContext context) {
    double widthOfScreen = MediaQuery.of(context).size.width;
    double heightOfScreen = MediaQuery.of(context).size.height;

    void _onHover(bool hovering) {
      setState(() {
        _isHovered = hovering;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Page',
          style: TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 24,
            fontWeight: FontWeight.w700,
            fontFamily: 'merich',
            fontStyle: FontStyle.italic,
          ),),
        backgroundColor: const Color.fromARGB(245, 239, 176, 216),
        shadowColor: const Color.fromARGB(100, 51, 22, 50),
      ),
      body: Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 254, 196, 234)),
            child:  Stack(
              children:<Widget> [
                Positioned(
                    left: 110,
                    top: heightOfScreen * 0.39,
                    child: SizedBox(
                      width: 500,
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
                            fontWeight: FontWeight.w300,
                            fontSize: 24,
                            fontFamily: 'chunck'
                          ),
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide(
                              color: Color.fromARGB(255, 24, 21, 66),)
                          ),
                          hintText: 'please add your ID here!',
                          hintStyle: const TextStyle(
                          fontSize: 23,
                          color: Color.fromARGB(255, 24, 21, 66),
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
                                style: BorderStyle.solid),
                          ),
                        ),
                      ),
                    )),
                Positioned(
                    left: 110,
                    top: heightOfScreen * 0.465,
                    child: SizedBox(
                      width: 500,
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
                            fontWeight: FontWeight.w300,
                            fontSize: 24,
                              fontFamily: 'chunck'
                          ),
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 24, 21, 66))
                          ),
                          hintText: 'Please add the Password here!',
                          hintStyle: const TextStyle(
                            fontSize: 23,
                            color: Color.fromARGB(255, 24, 21, 66),
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
                            borderSide: BorderSide(
                                color: Colors.deepPurple.shade800,
                                style: BorderStyle.solid),
                          ),
                        ),
                      ),
                    )),
                Positioned(
                  top: heightOfScreen * 0.53,
                  left: 110,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoScreen(),
                        ),
                      );
                    },
                    child: const Text("No account? Sign up ",
                            style: TextStyle(
                                color: Color.fromARGB(255, 24, 21, 66),
                                fontFamily: 'chunck',
                                fontSize: 21,
                                fontWeight: FontWeight.w100)),

                    ),
                  ),
                Positioned(
                  top: heightOfScreen * 0.54,
                  right: 110,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InfoScreen()),
                      );
                    },
                    child: MouseRegion(
                      onEnter: (_) => _onHover(true),
                      onExit: (_) => _onHover(false),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        width: _isHovered ? 128 : 120,
                        height: _isHovered ? 58 : 50,
                        decoration: BoxDecoration(
                          color: _isHovered ? Colors.purple : Colors.white60,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: _isHovered ? Colors.white : Colors.purple,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
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
