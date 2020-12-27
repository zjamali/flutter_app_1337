import 'dart:convert' show jsonDecode;
import 'package:flutter_app/models/user.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class Services1 {
  static Future<UserData> getUserData(var token, String login) async {
    try {
      final responses =
          await http.get('https://api.intra.42.fr/v2/users/$login', headers: {
        HttpHeaders.authorizationHeader: 'Bearer $token',
      });
      print('get user data == >${responses.body}');
      if (responses.statusCode == 200) {
        print('response ==== 200');
        //final user = UserData.fromJson(jsonDecode(responses.body));
        final user = userDataFromJson(responses.body);
        print('user ------ >${user.login}');
        return user;
      } else {
        return UserData();
      }
    } catch (e) {
      return UserData();
    }
  }
}
