import 'package:dartz/dartz.dart';
import 'package:todo_task_management/features/todo/todo.dart';
import 'package:todo_task_management/core/core.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDatabase todoRemoteDatabase;
  TodoRepositoryImpl({
    required this.todoRemoteDatabase,
  });

  @override
  Future<Either<Failure, Todo>> add(Todo todo) async {
    try {
      final results = await todoRemoteDatabase.addTodo(todo);
      return Right(results);
    } catch (e) {
      return Left(Failure('Failed to add todo'));
    }
  }

  @override
  Future<Either<Failure, Todo>> delete(Todo todo) async {
    try {
      final results = await todoRemoteDatabase.deleteTodo(todo);
      return Right(results);
    } catch (e) {
      return Left(Failure('Failed to delete todo'));
    }
  }

  @override
  Future<Either<Failure, List<Todo>>> getAll() async {
    try {
      final results = await todoRemoteDatabase.getAllTodos();
      return Right(results);
    } catch (e) {
      return Left(Failure('Failed to get all todos'));
    }
  }

  @override
  Future<Either<Failure, Todo>> update(Todo todo) async {
    try {
      final results = await todoRemoteDatabase.updateTodo(todo);
      return Right(results);
    } catch (e) {
      return Left(Failure('Failed to update todo'));
    }
  }

  @override
  Future<Either<Failure, List<Todo>>> reorder(List<Todo> todos) async {
    try {
      final results = await todoRemoteDatabase.reorderTodos(todos);
      return Right(results);
    } catch (e) {
      return Left(Failure('Failed to reorder todos'));
    }
  }
}
