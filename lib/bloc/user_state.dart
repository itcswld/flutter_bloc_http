part of 'user_bloc.dart';

@immutable
abstract class UserState extends Equatable {}

class UserInitState extends UserState {
  @override
  // [] means , this not going to pass anything
  List<Object?> get props => [];
}

//loaded state
class UserLoadedState extends UserState {
  final List<UserModel> users;
  UserLoadedState(this.users);
  @override
  // pass data
  List<Object?> get props => [users];
}

//err state
class UserErrState extends UserState {
  final Object err;
  UserErrState(this.err);
  @override
  //pass nothing
  List<Object?> get props => [err];
}
