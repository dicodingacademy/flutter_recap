import 'package:equatable/equatable.dart';

class DogBreed extends Equatable{
  const DogBreed({
    required this.message,
    required this.status,
  });

  final Map<String, List<String>> message;
  final String status;

  @override
  List<Object?> get props => [message, status];
}
