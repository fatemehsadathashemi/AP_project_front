import 'package:approjectfront/student/studentLogin.dart';
import 'package:flutter/material.dart';

class StudentInfoPage extends StatelessWidget {
  const StudentInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightOfScreen = MediaQuery.of(context).size.height;
    double widthOfScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student Information',
          style: TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 24,
            fontWeight: FontWeight.w500,
            fontFamily: 'merich',
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: const Color.fromARGB(245, 239, 176, 216),
        shadowColor: const Color.fromARGB(100, 51, 22, 50),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: const Color.fromARGB(255, 254, 196, 234),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: heightOfScreen * 0.04,
              horizontal: widthOfScreen * 0.15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Information
                _buildProfileSection(widthOfScreen),

                SizedBox(height: heightOfScreen * 0.03),

                // Academic Information
                _buildAcademicSection(),

                SizedBox(height: heightOfScreen * 0.03),


              ],
            ),
          ),
        ),
      ),
      drawer: _buildDrawer(context),
    );
  }

  Widget _buildProfileSection(double widthOfScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Profile Information',
          style: TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 25,
            fontFamily: 'chunck',
          ),
        ),
        SizedBox(height: widthOfScreen * 0.04),
        Row(
          children: [
            const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('images/pr.png'),
            ),
            SizedBox(width: widthOfScreen * 0.05),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name: Fatemeh Hashemi',
                  style: TextStyle(
                    color: Color.fromARGB(255, 24, 21, 66),
                    fontSize: 21,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'Student ID: 123456789',
                  style: TextStyle(
                    color: Color.fromARGB(255, 24, 21, 66),
                    fontSize: 21,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAcademicSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Academic Information',
          style: TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 25,
            fontFamily: 'chunck',
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Current Semester Units: 22',
          style: TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 21,
            fontWeight: FontWeight.bold),
        ),
        Text(
          'GPA: 3.65',
          style: TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }


  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Color.fromARGB(245, 239, 176, 216),
    ),
        child: Text(
          '  Menu',
          style: TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 30,
            fontFamily: 'merich',
          ),
        ),
      ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Profile Settings'),
              onTap: () {

              },
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Academic Records'),
              onTap: () {

              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text('Course Management'),
              onTap: () {

              },
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text('Weekly Schedule'),
              onTap: () {
              },
            ),
            ListTile(
              leading: const Icon(Icons.library_books),
              title: const Text('Exams Schedule'),
              onTap: () {

              },
            ),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StudentLogin(),
          ),
        );
      },
    ),
          ],
      ),
    );
  }
}

