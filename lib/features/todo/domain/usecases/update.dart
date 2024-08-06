import 'package:dartz/dartz.dart';
import 'package:todo_task_management/features/todo/todo.dart';
import 'package:todo_task_management/core/core.dart';

class UpdateTodoUseCase implements Usecase<Todo, Params<Todo>> {
  final TodoRepository repository;

  UpdateTodoUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, Todo>> call(Params todo) async {
    return await repository.update(todo.data);
  }
}
