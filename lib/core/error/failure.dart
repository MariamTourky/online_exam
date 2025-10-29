import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(String message) : super(message);
}

class TimeoutFailure extends Failure {
  const TimeoutFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure(String message) : super(message);
}

class UnknownFailure extends Failure {
  const UnknownFailure(String message) : super(message);
}
