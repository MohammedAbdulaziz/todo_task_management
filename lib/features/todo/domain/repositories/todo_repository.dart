import 'package:dartz/dartz.dart';
import 'package:todo_task_management/features/todo/todo.dart';
import 'package:todo_task_management/core/core.dart';

abstract class TodoRepository {
  Future<Either<Failure, Todo>> add(Todo todo);
  Future<Either<Failure, Todo>> update(Todo todo);
  Future<Either<Failure, Todo>> delete(Todo todo);
  Future<Either<Failure, List<Todo>>> getAll();
  Future<Either<Failure, List<Todo>>> reorder(List<Todo> todos);
}
