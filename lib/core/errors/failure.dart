/// Base domain failure returned inside `Left(...)` of an `Either`.
abstract class Failure {
  const Failure(this.message);

  final String message;
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}
