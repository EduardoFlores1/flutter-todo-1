import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTask extends StatelessWidget {
  final String taskName;
  final bool isChecked;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  Function(BuildContext)? editFunction;
  ToDoTask(
      {super.key,
      required this.taskName,
      required this.isChecked,
      required this.onChanged,
      required this.deleteFunction,
      required this.editFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: editFunction,
              icon: Icons.edit,
              backgroundColor: Colors.orange,
              borderRadius: BorderRadius.circular(12),
            ),
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.deepPurple[200],
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Checkbox(
                value: isChecked,
                onChanged: onChanged,
                activeColor: Colors.deepPurple[800],
              ),
              Expanded(
                child: Text(
                  taskName,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: isChecked
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
