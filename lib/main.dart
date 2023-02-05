import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Repos/UserRepos.dart';
import 'View/HomePages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*Repos is loading the data from svr.
      only once its okay(loaded), and then those data and states they would be available for the child widget
      */
      home: RepositoryProvider(
        //loading the data from svr.
        create: (context) => UserRepos(), //inject the user repos.
        child: HomePage(),
      ),
    );
  }
}
