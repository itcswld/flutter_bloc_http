import 'package:flutter/material.dart';
import 'package:flutter_bloc_http/Model/UserModel.dart';

class UserPage extends StatelessWidget {
  final UserModel user;
  const UserPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar),
                  maxRadius: 60,
                ),
              ),
              Text('\n${user.firstName} ${user.lastName}'),
              Text(user.email),
            ],
          ),
        ),
      ),
    );
  }
}
