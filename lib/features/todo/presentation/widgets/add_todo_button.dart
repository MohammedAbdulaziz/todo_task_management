import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_task_management/features/todo/todo.dart';

class AddTodoButton extends StatelessWidget {
  final WidgetRef ref;

  const AddTodoButton({Key? key, required this.ref}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 40.w,
      height: 60.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        onPressed: () => addTodoDialogHelper(context, ref),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.add),
            SizedBox(width: 16.w),
            const Text('Add a Task'),
          ],
        ),
      ),
    );
  }
}
