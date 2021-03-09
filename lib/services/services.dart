import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:flutter_app/models/users.dart';
import 'dart:convert';

class Services {
  static Future<String> authenticate() async {
    final url =
        'https://api.intra.42.fr/oauth/authorize?client_id=8f31a6c907677ba8fc1e1c61aa88023279115a8d48cee399ecb968e5bca7e98f&redirect_uri=app%3A%2F%2Fopen.my.app&response_type=code';
    final callbackUrlScheme = 'app';

    //final result = await FlutterWebAuth.authenticate(url: url, callbackUrlScheme: callbackUrlScheme);
    //print(result);
    final result = await FlutterWebAuth.authenticate(
        url: url, callbackUrlScheme: callbackUrlScheme);
    final code = Uri.parse(result).queryParameters['code'];
    final response =
        await http.post('https://api.intra.42.fr/oauth/token', body: {
      'client_id':
          '8f31a6c907677ba8fc1e1c61aa88023279115a8d48cee399ecb968e5bca7e98f',
      'redirect_uri': 'app://open.my.app',
      'grant_type': 'authorization_code',
      'client_secret':
          'client secret here',
      'code': code,
    });
    final String accessToken = jsonDecode(response.body)['access_token'] as String;
    print(accessToken);
    return accessToken;
    /*
    final responses = await http.get('https://api.intra.42.fr/v2/me', headers: {
      HttpHeaders.authorizationHeader: 'Bearer $accessToken',
    });
    */
  }
  static var token;
  static List<UsersList> users = [];


  static List<UsersList> checkRepeting(List<UsersList> users,List<UsersList> newUsers){
    int i = 0;
    while(i < newUsers.length) {
      if (users[0].id == newUsers[i].id){
        List<UsersList> subList = newUsers.sublist(0,i);
        return subList;
      }
      i++;
    }
    return newUsers;
  }
  static Future<List<UsersList>> getUsers(var token,int pageNumber) async{
    //for (int i = 0; i < 10; i++) {
      try {
        final responses = await http.get(
            'https://api.intra.42.fr/v2/cursus/21/cursus_users?filtre[created_at]=2020-11-11T09:57:18.084Z&filter[campus_id]=16&range[begin_at]=2019-10-16T00:00:00.000Z,2019-10-17T00:00:00.000Z&page=$pageNumber&per_page=100',
            headers: {
              HttpHeaders.authorizationHeader: 'Bearer $token',
            });
        print(responses.body);
        if (responses.statusCode == 200) {
          final newUsers = usersListFromJson(responses.body);
          print('new === ${newUsers.length}');
          /*for (int j = 0 ; j < newUsers.length; j++) {
            if (users[0].user.id == newUsers[j].user.id){
              List<UsersList> subList = newUsers.sublist(0,i);
              return users + subList;
            }
          }*/
          users = users + newUsers;
          print(users.length);
          return users;
        }
        else {
          return List<UsersList>();
        }
      }
      catch (e) {
        return List<UsersList>();
      }
    }
   // return users;
 // }
}
