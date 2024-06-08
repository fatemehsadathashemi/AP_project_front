import 'package:flutter/material.dart';
import 'InfoScreen.dart';

class ProfessorLogin extends StatefulWidget {
  const ProfessorLogin({super.key});

  @override
  State<ProfessorLogin> createState() => _ProfessorLoginState();
}

class _ProfessorLoginState extends State<ProfessorLogin> {
  TextEditingController professorID = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obscure = true, userIDChecker = true, passwordChecker = true;
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    double heightOfScreen = MediaQuery.of(context).size.height;
    double widthOfScreen = MediaQuery.of(context).size.width;

    void _onHover(bool hovering) {
      setState(() {
        _isHovered = hovering;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Professor Page',
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
              height: heightOfScreen * 0.4,
              width: widthOfScreen * 0.75,
              top: heightOfScreen * 0.045,
              left: widthOfScreen * 0.125,
              child: SizedBox(
                child: Image.asset('images/prof.png'),
              ),
            ),
            Positioned(
              left: widthOfScreen * 0.15,
              top: heightOfScreen * 0.49,
              child: SizedBox(
                width: widthOfScreen * 0.7,
                child: TextFormField(
                  controller: professorID,
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
                    hintText: 'Please add your ID here!',
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 24, 21, 66),
                      fontSize: 24,
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
              top: heightOfScreen * 0.56,
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
                    hintText: 'Please add the Password here!',
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 24, 21, 66),
                      fontSize: 24,
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
              top: heightOfScreen * 0.63,
              left: widthOfScreen * 0.15,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InfoScreen(),
                    ),
                  );
                },
                child: const Text(
                  "No account? Sign up",
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
              top: heightOfScreen * 0.63,
              right: widthOfScreen * 0.15,
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
                    duration: const Duration(milliseconds: 200),
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
