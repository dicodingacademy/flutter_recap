import 'package:equatable/equatable.dart';

class FailureException extends Equatable {
  final String message;

  const FailureException(
    this.message,
  );

  @override
  String toString() => 'FailureException(message: $message)';

  @override
  List<Object> get props => [message];
}
