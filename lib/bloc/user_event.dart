part of 'user_bloc.dart';

@immutable //after creating this classes we are not going to change the properties these classes
abstract class UserEvent extends Equatable {}

class InitUserEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}
