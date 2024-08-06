import 'package:dartz/dartz.dart';
import 'package:todo_task_management/features/todo/todo.dart';
import 'package:todo_task_management/core/core.dart';

class GetAllTodoUseCase implements Usecase<List<Todo>, NoParams> {
  final TodoRepository repository;

  GetAllTodoUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<Todo>>> call(NoParams params) {
    return repository.getAll();
  }
}
