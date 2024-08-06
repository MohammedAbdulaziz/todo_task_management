import 'package:flutter/material.dart';
import 'package:todo_task_management/features/todo/todo.dart';

class AddTodoDialog extends StatefulWidget {
  const AddTodoDialog({Key? key}) : super(key: key);

  @override
  AddTodoDialogState createState() => AddTodoDialogState();
}

class AddTodoDialogState extends State<AddTodoDialog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool _isCompleted = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Todo'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _descriptionController,
            decoration:
                const InputDecoration(labelText: 'Description (optional)'),
          ),
          Row(
            children: [
              const Text('Completed'),
              Checkbox(
                value: _isCompleted,
                onChanged: (value) {
                  setState(() {
                    _isCompleted = value!;
                  });
                },
              ),
            ],
          ),
        ],
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
            final String title = _titleController.text;
            final String description = _descriptionController.text;
            if (title.isNotEmpty) {
              Navigator.of(context).pop(Todo(
                id: 'new-id-${DateTime.now().millisecondsSinceEpoch}',
                title: title,
                description: description,
                isCompleted: _isCompleted,
              ));
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
