part of 'detail_bloc.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailInitial extends DetailState {}

class DetailLoading extends DetailState {}

class DetailLoaded extends DetailState {
  final String image;
  final String message;

  const DetailLoaded(this.image, this.message);

  @override
  List<Object> get props => [image, message];
}

class DetailNoData extends DetailState {
  final String message;

  const DetailNoData(this.message);

  @override
  List<Object> get props => [message];
}

class DetailError extends DetailState {
  final String message;

  const DetailError(this.message);

  @override
  List<Object> get props => [message];
}
