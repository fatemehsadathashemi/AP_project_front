import 'package:approjectfront/student/studentAssignment.dart';
import 'package:approjectfront/student/studentLogin.dart';
import 'package:approjectfront/student/studentTodolist.dart';
import 'package:flutter/material.dart';

class StudentInfoPage extends StatelessWidget {
  const StudentInfoPage({super.key});

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
                    SizedBox(height: heightOfScreen * 0.10 ),
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
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Name: Fatemeh Hashemi',
          style: TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Student ID: 123456789',
          style: TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildAcademicSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Current Semester Units: 22',
          style: TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'GPA: 3.65',
          style: TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Major: Computer Engineering',
          style: TextStyle(
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
            leading: const Icon(Icons.assignment),
            title: const Text('To Do List'),
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
        final firstNameController = TextEditingController();
        final lastNameController = TextEditingController();
        final emailController = TextEditingController();
        final birthdayController = TextEditingController();
        String? genderValue;

        return AlertDialog(
          title: const Text('Edit Information'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                  ),
                ),
                TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                  ),
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                TextFormField(
                  controller: birthdayController,
                  decoration: const InputDecoration(
                    labelText: 'Birthday',
                  ),
                  onTap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      birthdayController.text =
                      "${pickedDate.toLocal()}".split(' ')[0];
                    }
                  },
                ),
                DropdownButtonFormField<String>(
                  value: genderValue,
                  items: ['Male', 'Female', 'Other']
                      .map((label) => DropdownMenuItem(
                    value: label,
                    child: Text(label),
                  ))
                      .toList(),
                  hint: const Text('Gender'),
                  onChanged: (value) {
                    genderValue = value;
                  },
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
                // Add your save logic here
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
        final oldPasswordController = TextEditingController();
        final newPasswordController = TextEditingController();
        final confirmPasswordController = TextEditingController();

        return AlertDialog(
          title: const Text('Change Password'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: oldPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Old Password',
                  ),
                ),
                TextFormField(
                  controller: newPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'New Password',
                  ),
                ),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                  ),
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
                // Add your change password logic here
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
                // Add your delete account logic here
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}