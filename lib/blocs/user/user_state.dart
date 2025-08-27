import 'package:equatable/equatable.dart';
import '../../models/user/user.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<User> users;
  final User currentUser;

  const UserLoaded(this.users, this.currentUser);

  @override
  List<Object?> get props => [users, currentUser];
}

class UserError extends UserState {
  final String message;

  const UserError(this.message);

  @override
  List<Object?> get props => [message];
}
