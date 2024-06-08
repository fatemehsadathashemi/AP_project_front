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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: heightOfScreen * 0.02,
              horizontal: widthOfScreen * 0.1,
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

                // Schedule
                _buildScheduleSection(),

                SizedBox(height: heightOfScreen * 0.03),

                // Notifications
                _buildNotificationsSection(),

                SizedBox(height: heightOfScreen * 0.03),

                // Upcoming Events
                _buildUpcomingEventsSection(),
              ],
            ),
          ),
        ),
      ),
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
            fontSize: 23,
            fontWeight: FontWeight.bold,
            fontFamily: 'chunck',
          ),
        ),
        SizedBox(height: widthOfScreen * 0.02),
        Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('images/profile.png'), // Placeholder image
            ),
            SizedBox(width: widthOfScreen * 0.05),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Name: John Doe',
                  style: TextStyle(
                    color: Color.fromARGB(255, 24, 21, 66),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'chunck',
                  ),
                ),
                Text(
                  'Student ID: 123456789',
                  style: TextStyle(
                    color: Color.fromARGB(255, 24, 21, 66),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'chunck',
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Academic Information',
          style: TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 23,
            fontWeight: FontWeight.bold,
            fontFamily: 'chunck',
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Current Semester Units: 18',
          style: TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: 'chunck',
          ),
        ),
        Text(
          'GPA: 3.75',
          style: TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: 'chunck',
          ),
        ),
      ],
    );
  }

  Widget _buildScheduleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Schedule',
          style: TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 23,
            fontWeight: FontWeight.bold,
            fontFamily: 'chunck',
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Monday: Math 101 - 9:00 AM - 10:30 AM',
          style: TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: 'chunck',
          ),
        ),
        Text(
          'Wednesday: Physics 201 - 11:00 AM - 12:30 PM',
          style: TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: 'chunck',
          ),
        ),
        // Add more schedule details as needed
      ],
    );
  }

  Widget _buildNotificationsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Notifications',
          style: TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 23,
            fontWeight: FontWeight.bold,
            fontFamily: 'chunck',
          ),
        ),
        SizedBox(height: 10),
        Text(
          'No new notifications.',
          style: TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: 'chunck',
          ),
        ),
      ],
    );
  }

  Widget _buildUpcomingEventsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Upcoming Events',
          style: TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 23,
            fontWeight: FontWeight.bold,
            fontFamily: 'chunck',
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Midterm Exams: March 15 - March 22',
          style: TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: 'chunck',
          ),
        ),
        Text(
          'Spring Break: April 1 - April 7',
          style: TextStyle(
            color: Color.fromARGB(255, 24, 21, 66),
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: 'chunck',
          ),
        ),
        // Add more events as needed
      ],
    );
  }
}
