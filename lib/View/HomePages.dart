import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_http/Model/UserModel.dart';
import 'package:flutter_bloc_http/View/UserPage.dart';

import '../Repos/UserRepos.dart';
import '../bloc/user_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //injecting Bloc
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepos>(context),
      )..add(InitUserEvent()), //emit(trigger) the state
      child: Scaffold(
        appBar: AppBar(
          title: Text('bloc_http'),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserInitState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserLoadedState) {
              //get data form state
              List<UserModel> users = state.users;
              return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (_, i) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => UserPage(user: users[i])));
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(users[i].firstName),
                          subtitle: Text(users[i].lastName),
                          trailing: CircleAvatar(
                            backgroundImage: NetworkImage(users[i].avatar),
                          ),
                        ),
                      ),
                    );
                  });
            }
            if (state is UserErrState) {
              Object err = state.err;
              return Center(child: Text(err.toString()));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
