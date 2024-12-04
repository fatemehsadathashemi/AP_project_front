import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class StudentAssignmentsPage extends StatelessWidget {
  const StudentAssignmentsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Assignments',
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
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _AssignmentListItem(
              assignmentTitle: 'Assignment 1',
              courseName: 'Mathematics',
              deadline: DateTime(2024, 7, 15, 12, 0), // Example deadline
              isDone: false, // Example of distinguishing done assignments
            ),
            _AssignmentListItem(
              assignmentTitle: 'Assignment 2',
              courseName: 'Science',
              deadline: DateTime(2024, 7, 16, 10, 30), // Example deadline
              isDone: false, // Example of distinguishing done assignments
            ),
            _AssignmentListItem(
              assignmentTitle: 'Assignment 3',
              courseName: 'History',
              deadline: DateTime(2024, 7, 18, 15, 0), // Example deadline
              isDone: true, // Example of distinguishing done assignments
            ),
            // Add more assignments as needed
          ],
        ),
      ),
    );
  }
}

class _AssignmentListItem extends StatefulWidget {
  final String assignmentTitle;
  final String courseName;
  final DateTime deadline;
  bool isDone;

   _AssignmentListItem({
    required this.assignmentTitle,
    required this.courseName,
    required this.deadline,
    required this.isDone,
  });

  @override
  __AssignmentListItemState createState() => __AssignmentListItemState();
}

class __AssignmentListItemState extends State<_AssignmentListItem> {
  late DateTime _estimatedTime;
  TextEditingController _descriptionController = TextEditingController();
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    _estimatedTime = widget.deadline.subtract(Duration(hours: 1)); // Initial estimated time
    _descriptionController.text = ''; // Initial description
    var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: onSelectNotification);
  }

  Future<void> onSelectNotification(String? payload) async {
    // Handle notification tap
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showAssignmentDetails(context);
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.assignmentTitle, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(
                    'Deadline: ${widget.deadline.day}/${widget.deadline.month}/${widget.deadline.year}',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text('Course: ${widget.courseName}', style: TextStyle(fontSize: 14)),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Checkbox(
                    value: widget.isDone,
                    onChanged: (value) {
                      setState(() {
                        widget.isDone = value ?? false;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAssignmentDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 4,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                Text(
                  widget.assignmentTitle,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text('Course: ${widget.courseName}'),
                SizedBox(height: 10),
                Text('Deadline: ${widget.deadline.toString()}'),

                const SizedBox(height: 20),

                // Remaining time calculation
                Text('Remaining Time: ${_calculateRemainingTime()}'),

                const SizedBox(height: 20),

                // Editable estimated time
                Row(
                  children: [
                    Text('Estimated Time:'),
                    SizedBox(width: 10),
                    Container(
                      width: 80,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Hours',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {
                            int hours = int.tryParse(value) ?? 0;
                            _estimatedTime = DateTime(
                              _estimatedTime.year,
                              _estimatedTime.month,
                              _estimatedTime.day,
                              hours,
                              _estimatedTime.minute,
                            );
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 80,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Minutes',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {
                            int minutes = int.tryParse(value) ?? 0;
                            _estimatedTime = DateTime(
                              _estimatedTime.year,
                              _estimatedTime.month,
                              _estimatedTime.day,
                              _estimatedTime.hour,
                              minutes,
                            );
                          });
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Upload PDF button
                ElevatedButton.icon(
                  onPressed: () {
                    _uploadPDF(context);
                  },
                  icon: Icon(Icons.file_upload),
                  label: Text('Upload PDF'),
                ),

                const SizedBox(height: 20),

                // Writable description box
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  minLines: 3,
                  maxLines: 5,
                ),

                const SizedBox(height: 20),

                // Send button
                ElevatedButton(
                  onPressed: () {
                    _sendAssignment();
                    Navigator.of(context).pop();
                  },
                  child: Text('Send'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _calculateRemainingTime() {
    Duration remaining = widget.deadline.difference(DateTime.now());
    if (remaining.isNegative) {
      return 'Deadline passed';
    } else {
      return '${remaining.inDays} days ${remaining.inHours.remainder(24)} hours ${remaining.inMinutes.remainder(60)} minutes';
    }
  }

  Future<void> _uploadPDF(BuildContext context) async {
    // Implement PDF upload functionality
    // Example placeholder
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Upload PDF'),
          content: Text('Placeholder for PDF upload functionality.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _sendAssignment() {
    // Implement send assignment functionality
    // Example placeholder
    print('Assignment sent.');
  }
}

void main() {
  runApp(MaterialApp(
    home: StudentAssignmentsPage(),
  ));
}
