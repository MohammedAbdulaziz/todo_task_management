import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_task_management/config/config.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Something went wrong"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.goNamed(RoutesName.home),
          child: const Text("Go to home page"),
        ),
      ),
    );
  }
}
