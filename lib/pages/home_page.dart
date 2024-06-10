import 'package:flutter/material.dart';
import 'package:todoapp_practice/util/dialog_box.dart';
import 'package:todoapp_practice/util/todo_task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List tasks = [
    ["Dannespino > Todas", true],
    ["Hablarle", false],
    ["Mary > Mictia", true]
  ];

  final _controller = TextEditingController();

  void checkBoxChanged(int index) {
    setState(() {
      tasks[index][1] = !tasks[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      if (_controller.text == "") {
        return;
      }
      tasks.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void editTask(int index) {
    setState(() {
      if (_controller.text == "") {
        return;
      }
      tasks[index][0] = _controller.text;
    });
    Navigator.of(context).pop();
  }

  void editFunction(int index) {
    _controller.text = tasks[index][0];
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
              controller: _controller,
              isEdit: true,
              onSaved: () => editTask(index),
              onCancel: () => Navigator.of(context).pop());
        });
  }

  void deleteFunction(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void openDialogCreate() {
    _controller.clear();
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          isEdit: false,
          onSaved: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "TODO - APP",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple[700],
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ToDoTask(
            taskName: tasks[index][0],
            isChecked: tasks[index][1],
            onChanged: (p0) => checkBoxChanged(index),
            deleteFunction: (context) => deleteFunction(index),
            editFunction: (context) => editFunction(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openDialogCreate,
        backgroundColor: Colors.deepPurple[700],
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
