import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/user.dart';
import 'package:flutter_app/services/services.dart';
import 'package:flutter_app/models/users.dart';
import 'package:flutter_app/services/services1.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<UsersList> _users;
  UserData _userData;
  String url =
      'https://icon-library.com/images/login-icon-png/login-icon-png-1.jpg';

  @override
  void initState() {
    super.initState();
    Services.getUsers(Services.token).then((users) {
      setState(() {
        _users = users;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Card(
        child: ListView.builder(
          itemCount: _users == null ? 0 : _users.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                title: Text(_users[index].user.login),
                subtitle: Text(_users[index].level.toString()),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage('https://cdn.intra.42.fr/users/${_users[index].user.login}.jpg'),
                  radius: 20,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/*
body: ListView.builder(
        itemCount: _users == null ? 0 : _users.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(_users[index].user.login),
              subtitle: Text(_users[index].user.url),
              leading: CircleAvatar(
                backgroundImage:
                NetworkImage('https://cdn.intra.42.fr/users/zjamali.jpg'),
                radius: 20,
              ),
            ),
          );
        },
      ),


body: ListView.builder(
        itemCount: _users == null ? 0 : _users.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_users[index].user.login),
            subtitle: Text(_users[index].user.url),
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage('https://cdn.intra.42.fr/users/zjamali.jpg'),
              radius: 20,
            ),
          );
        },
      ),




body: ListView.builder(
        itemCount: _userdata == null ? 0 : _userdata.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_userdata[index].login),
            subtitle: Text(_userdata[index].url),
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage(_userdata[index].imageUrl),
              radius: 20,
            ),
          );
        },
      ),

 */
