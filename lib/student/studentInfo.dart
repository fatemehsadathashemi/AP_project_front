import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:approjectfront/student/studentAssignment.dart';
import 'package:approjectfront/student/studentLogin.dart';
import 'package:approjectfront/student/studentTodolist.dart';

class StudentInfoPage extends StatefulWidget {
  final String studentId;


  const StudentInfoPage({super.key, required this.studentId});

  @override
  State<StudentInfoPage> createState() => _StudentInfoPageState();

}

class _StudentInfoPageState extends State<StudentInfoPage> {
  String response = "";
  String firstName = "";
  String lastName = "";
  String email = "";
  String birthday = "";
  String gender = "";
  String numberOfUnits = "";
  String gpa = "";
  String major = "";

  @override
  void initState() {
    super.initState();
    informationDetector();
  }

  Future<void> informationDetector() async {
    try {
      final serverSocket = await Socket.connect("192.168.147.204", 8080);
      serverSocket.write('GET: StudentInformation~${widget.studentId}\u0000');
      await serverSocket.flush();

      serverSocket.listen((socketResponse) {
        setState(() {
          response = String.fromCharCodes(socketResponse);
          print("Response from server: $response");
          _parseResponse();
          serverSocket.close();
        });
        serverSocket.destroy(); // Close the socket after receiving response
      }).onError((error) {
        print("Error: $error");
        serverSocket.destroy(); // Close the socket on error
      });
    } catch (e) {
      print("Exception: $e");
    }
  }

  void _parseResponse() {
    final parts = response.split('~');
    if (parts.length >= 10) {
      setState(() {
        firstName = parts[2];
        lastName = parts[3];
        email = parts[4];
        birthday = parts[5];
        gender = parts[6];
        numberOfUnits = parts[7];
        gpa = parts[8];
        major = parts[9];
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        birthday = "${pickedDate.month}/${pickedDate.day}/${pickedDate.year}";
      });
    }
  }

  void updateProfile(String editedUserInformation) async {
    try {
      final serverSocket = await Socket.connect("192.168.147.204", 8080);

      serverSocket.write('POST: EditedInformation~$editedUserInformation');
      await serverSocket.flush();

      serverSocket.listen(
            (socketResponse) {
          // Handle server response if needed
          print('Server response: ${String.fromCharCodes(socketResponse)}');
          serverSocket.destroy(); // Close the socket after response
        },
        onError: (error) {
          print('Error listening to server: $error');
          serverSocket.destroy(); // Close the socket on error
        },
        onDone: () {
          print('Socket closed by server');
          serverSocket.destroy(); // Close the socket on completion
        },
      );

    } catch (e) {
      print('Error connecting to server: $e');
    }
  }


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
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: heightOfScreen * 0.15),
                width: widthOfScreen * 0.55,
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 24, 21, 66),
                      offset: Offset(0, 8),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: heightOfScreen * 0.10),
                    _buildProfileSection(),
                    SizedBox(height: heightOfScreen * 0.03),
                    _buildAcademicSection(),
                    SizedBox(height: heightOfScreen * 0.03),
                    _buildActionsSection(context),
                  ],
                ),
              ),
            ),
            Positioned(
              top: heightOfScreen * 0.08,
              left: widthOfScreen * 0.5 - 80,  // Center the CircleAvatar
              child: const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('images/pr.png'),
              ),
            ),
          ],
        ),
      ),
      drawer: _buildDrawer(context),
    );
  }

  Widget _buildProfileSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Name: $firstName $lastName',
          style: const TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Student ID: ${widget.studentId}',
          style: const TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Email: $email',
          style: const TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Birthday: $birthday',
          style: const TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Gender: $gender',
          style: const TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildAcademicSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Current Semester Units: $numberOfUnits',
          style: const TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'GPA: $gpa',
          style: const TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Major: $major',
          style: const TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildActionsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            _showEditInformationDialog(context);
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 169, 17, 113),
            textStyle: const TextStyle(fontSize: 20),
          ),
          child: const Text('Edit Information'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            _showChangePasswordDialog(context);
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 169, 17, 113),
            textStyle: const TextStyle(fontSize: 20),
          ),
          child: const Text('Change Password'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            _showDeleteAccountDialog(context);
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 169, 17, 113),
            textStyle: const TextStyle(fontSize: 20),
          ),
          child: const Text('Delete Account'),
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
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Academic Records'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Course Management'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.schedule),
            title: const Text('Weekly Schedule'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.calendar_today),
            title: const Text('Exams Schedule'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.assignment),
            title: const Text('Assignments'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StudentAssignmentsPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.check_circle_outline),
            title: const Text('To-Do List'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StudentToDoListPage(),
                ),
              );
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

  void _showEditInformationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController firstNameController = TextEditingController(text: firstName);
        TextEditingController lastNameController = TextEditingController(text: lastName);
        TextEditingController emailController = TextEditingController(text: email);
        TextEditingController genderController = TextEditingController(text: gender);

        return AlertDialog(
          title: const Text('Edit Information'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: firstNameController,
                  decoration: const InputDecoration(labelText: 'First Name'),
                ),
                TextField(
                  controller: lastNameController,
                  decoration: const InputDecoration(labelText: 'Last Name'),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                Row(
                  children: [
                    const Text('Birthday: '),
                    TextButton(
                      onPressed: () {
                        _selectDate(context);
                      },
                      child: Text(birthday.isEmpty ? 'Select Date' : birthday),
                    ),
                  ],
                ),
                TextField(
                  controller: genderController,
                  decoration: const InputDecoration(labelText: 'Gender'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                setState(() {
                  firstName = firstNameController.text;
                  lastName = lastNameController.text;
                  email = emailController.text;
                  gender = genderController.text;
                });

                final updatedResponse =
                    '${widget.studentId}~Fatemeh401~$firstName~$lastName~$email~$birthday~$gender~$numberOfUnits~$gpa~$major';

                print('Updated Response: $updatedResponse');
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController passwordController = TextEditingController();

        return AlertDialog(
          title: const Text('Change Password'),
          content: TextField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: 'New Password'),
            obscureText: true,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                String newPassword = passwordController.text;

                // Send the new password to the server here

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text('Are you sure you want to delete your account?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                // Send delete account request to the server here

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
