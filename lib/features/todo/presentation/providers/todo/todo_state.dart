import 'package:equatable/equatable.dart';
import 'package:todo_task_management/core/core.dart';
import 'package:todo_task_management/features/todo/todo.dart';

class TodoState extends Equatable {
  final List<Todo>? todos;
  final bool isLoading;
  final Failure? failureMessage;

  const TodoState({
    this.todos,
    this.failureMessage,
    required this.isLoading,
  });

  @override
  List<Object?> get props => [todos, isLoading, failureMessage];
}
