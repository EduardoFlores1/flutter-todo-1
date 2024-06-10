import 'package:flutter/material.dart';
import 'package:todoapp_practice/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final bool isEdit;
  VoidCallback onSaved;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSaved,
      required this.onCancel,
      required this.isEdit});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[200],
      content: Container(
        height: 170,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration:
                  const InputDecoration(hintText: "Type your task name"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // save button
                MyButton(
                    text: isEdit ? "Edit" : "Save",
                    onPressed: onSaved,
                    color: isEdit ? Colors.orange : Colors.green),
                // cancel button
                MyButton(text: "Cancel", onPressed: onCancel, color: Colors.red)
              ],
            )
          ],
        ),
      ),
    );
  }
}
