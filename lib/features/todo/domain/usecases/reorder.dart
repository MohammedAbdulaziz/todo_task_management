import 'package:dartz/dartz.dart';
import 'package:todo_task_management/features/todo/todo.dart';
import 'package:todo_task_management/core/core.dart';

class ReorderTodosUseCase implements Usecase<List<Todo>, Params<Todo>> {
  final TodoRepository repository;

  ReorderTodosUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<Todo>>> call(Params todos) async {
    return await repository.reorder(todos.data);
  }
}
