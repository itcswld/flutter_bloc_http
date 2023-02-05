import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../Model/UserModel.dart';
import '../Repos/UserRepos.dart';

part 'user_event.dart';
part 'user_state.dart';

//for inject(connect) event and state together
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepos _userRepos;
  UserBloc(this._userRepos) : super(UserInitState()) {
    //on() takes a type of events , use the event to do something
    on<InitUserEvent>((event, emit) async {
      //emit(trigger) a state to change UI
      emit(
          UserInitState()); //UI will call the Event cause the States to be emitted(triggered)
      try {
        final users = await _userRepos.getUsers();
        //trigger loaded state saving data
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrState(e));
      }
    });
  }
}
