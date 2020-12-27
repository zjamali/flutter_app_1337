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
          '1174c21103fb3aaa99fc3c5fdcc2f07027af7df3a8d86f83e1d503b6716a9d61',
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

  static Future<List<UsersList>> getUsers(var token) async{
    try{
      final responses = await http.get('https://api.intra.42.fr/v2/cursus/21/cursus_users?filtre[created_at]=2020-11-11T09:57:18.084Z&filter[campus_id]=16&page[size]=100&range[begin_at]=2019-10-16T00:00:00.000Z,2019-10-17T00:00:00.000Z', headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      });
      print(responses.body);
      if (responses.statusCode == 200){
        List<UsersList> users =  usersListFromJson(responses.body);
        return users;
      }
      else {
        return List<UsersList>();
      }
    }
    catch (e){
      return List<UsersList>();
    }
  }
}
