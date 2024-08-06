import 'package:dartz/dartz.dart';
import 'package:todo_task_management/core/core.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class Params<T> {
  final T data;
  Params(this.data);
}

class NoParams {
  final void data;
  NoParams(this.data);
}
