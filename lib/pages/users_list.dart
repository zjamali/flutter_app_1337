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
  List<UsersList> _users = [];
  var _time = DateTime.now();
  List<UsersList> _users1 = [];
  List<UsersList> _usersAl = [];
  String level;
  int pageNumber = 1;
  String url =
      'https://icon-library.com/images/login-icon-png/login-icon-png-1.jpg';
  Color lastColor = Colors.green;

  String calculateLevel(List<UsersList> _users) {
    var level = 0.0;
    for (int i = 0; i < _users.length; i++) {
      level = level + _users[i].level.toDouble();
    }
    print(level);
    level = level / _users.length;
    print(level);
    return level.toString().substring(0, 4);
  }

  @override
  void initState() {
    super.initState();
    print("page_number ===lll > $pageNumber");
    Services.getUsers(Services.token, pageNumber).then((users) {
      print("page_number === > $pageNumber");
      setState(() {
        _users1 = users;
        _usersAl = _usersAl + _users1;
        _users = _usersAl;
        _users.sort((a, b) => a.level.compareTo(b.level));
        _users = _users.reversed.toList();
        print("time ==> $_time");
        //level = calculateLevel(_users);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: GridView.builder(
        //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 1.0, mainAxisSpacing: 1.0),
        itemCount: _users == null ? 0 : _users.length,
        itemBuilder: (BuildContext context, int index) {
          String daysCount;
          return Card(
            child: Column(
              children: [
                ListTile(
                  isThreeLine: true,
                  title: Text('\n' + _users[index].user.login),
                  subtitle: Text(_users[index].level.toString().length > 4
                      ? _users[index].level.toString().substring(0, 4)
                      : _users[index].level.toString()),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://cdn.intra.42.fr/users/${_users[index].user.login}.jpg'),
                    radius: 20,
                  ),
                  trailing: Text((index + 1).toString()),
                ),
                Text(
                  (daysCount = (((DateTime.parse(
                                          _users[index].blackholedAt.toString())
                                      .difference(_time)
                                      .inDays) >
                                  0
                              ? (DateTime.parse(
                                      _users[index].blackholedAt.toString())
                                  .difference(_time)
                                  .inDays)
                              : 0)
                          .toString())) +
                      " days left",
                  style: TextStyle(
                    color: getColorOfDay(daysCount.toString()),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  getColorOfDay(String daysCount) {
    final day = int.parse(daysCount);
    print("days ---> $day");
    if (day < 15) {
      return Colors.red;
    } else if (day >= 15 && day <= 30) {
      lastColor = Color.fromRGBO(223, 149, 57, 1);
      return Color.fromRGBO(223, 149, 57, 1);
    } else if (day > 30) {
      lastColor = Colors.green;
      return Colors.green;
    }
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
