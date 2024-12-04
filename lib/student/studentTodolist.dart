import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MaterialApp(
    home: StudentToDoListPage(),
  ));
}

class StudentToDoListPage extends StatefulWidget {
  const StudentToDoListPage({Key? key}) : super(key: key);

  @override
  _StudentToDoListPageState createState() => _StudentToDoListPageState();
}

class _StudentToDoListPageState extends State<StudentToDoListPage> {
  List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    // Add 5 initial tasks for demonstration
    _tasks = [
      Task(title: 'Task 1', deadline: DateTime.now().add(Duration(days: 1, hours: 10))),
      Task(title: 'Task 2', deadline: DateTime.now().add(Duration(days: 2, hours: 14))),
      Task(title: 'Task 3', deadline: DateTime.now().add(Duration(days: 3, hours: 16))),
      Task(title: 'Task 4', deadline: DateTime.now().add(Duration(days: 4, hours: 9))),
      Task(title: 'Task 5', deadline: DateTime.now().add(Duration(days: 5, hours: 12))),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'To Do List',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0), // Add padding at the top
                child: _buildToDoList(),
              ),
            ),
            _buildDoneTasks(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue, // Change the background color here
        foregroundColor: const Color.fromARGB(255, 24, 21, 66),
      ),
    );
  }

  Widget _buildToDoList() {
    _tasks.sort((a, b) => a.deadline.compareTo(b.deadline));
    List<Task> undoneTasks = _tasks.where((task) => !task.isDone).toList();

    return ListView.builder(
      itemCount: undoneTasks.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(undoneTasks[index].title),
          onDismissed: (direction) {
            setState(() {
              _tasks.remove(undoneTasks[index]);
            });
          },
          background: Container(
            color: Colors.red,
            child: const Icon(Icons.delete, color: Colors.white),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20.0),
          ),
          child: _buildTaskTile(undoneTasks[index]),
        );
      },
    );
  }

  Widget _buildDoneTasks() {
    List<Task> doneTasks = _tasks.where((task) => task.isDone).toList();

    if (doneTasks.isEmpty) {
      return Container();
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      color: const Color.fromARGB(255, 254, 196, 234),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Done Tasks',
            style: TextStyle(
              color: Color.fromARGB(255, 24, 21, 66),
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontFamily: 'merich',
              fontStyle: FontStyle.italic,
            ),
          ),
          Expanded(
            child: ListView(
              children: doneTasks.map((task) => _buildTaskTile(task)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskTile(Task task) {
    String formattedDate = DateFormat.yMMMd().format(task.deadline); // Format date
    String formattedTime = DateFormat.Hm().format(task.deadline); // Format time

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: task.isDone ? Colors.green[100] : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: task.isDone ? Colors.green : Colors.grey),
      ),
      child: ListTile(
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isDone ? TextDecoration.lineThrough : null,
            color: task.isDone ? Colors.green : Colors.black,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date: $formattedDate'), // Display formatted date
            Text('Time: $formattedTime'), // Display formatted time
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.check_circle, color: task.isDone ? Colors.green : Colors.grey),
              onPressed: () {
                setState(() {
                  task.isDone = !task.isDone;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.delete_outline, color: Colors.red),
              onPressed: () {
                setState(() {
                  _tasks.remove(task);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void _addTask() {
    showDialog(
      context: context,
      builder: (context) {
        final _formKey = GlobalKey<FormState>();
        String taskName = '';
        DateTime? pickedDate;
        TimeOfDay? pickedTime;

        return AlertDialog(
          title: const Text('Add New Task'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Task Name'),
                  onSaved: (value) {
                    taskName = value ?? '';
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a task name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () async {
                    pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(DateTime.now().year + 1),
                    );
                  },
                  child: const Text('Pick Date'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () async {
                    pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                  },
                  child: const Text('Pick Time'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  _formKey.currentState?.save();
                  if (pickedDate != null && pickedTime != null) {
                    setState(() {
                      _tasks.add(Task(
                        title: taskName,
                        deadline: DateTime(pickedDate!.year, pickedDate!.month, pickedDate!.day, pickedTime!.hour, pickedTime!.minute),
                      ));
                    });
                    Navigator.of(context).pop();
                  }
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

class Task {
  String title;
  DateTime deadline;
  bool isDone;

  Task({
    required this.title,
    required this.deadline,
    this.isDone = false,
  });
}
