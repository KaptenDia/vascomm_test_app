import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_case_vascomm/data/user/user_data.dart';
import 'package:study_case_vascomm/model/users/users_model.dart';
import 'package:http/http.dart' as http;

class UsersService extends ILogin {
  @override
  Future<UserModel?> login(String email, String password) async {
    final api = Uri.parse('https://reqres.in/api/login');
    final data = {"email": email, "password": password};
    // final dio = Dio();
    http.Response response;
    response = await http.post(api, body: data);
    if (response.statusCode == 200) {
      SharedPreferences storage = await SharedPreferences.getInstance();
      final body = json.decode(response.body);
      await storage.setString('TOKEN', body['token']);
      await storage.setString('EMAIL', email);
      return UserModel(
        email: email,
        token: body['token'],
      );
    } else {
      return null;
    }
  }

  @override
  Future<UserModel?> getUser() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final token = storage.getString('TOKEN');
    final email = storage.getString('EMAIL');
    if (token != null && email != null) {
      final userProfileResponse = await http.get(
        Uri.parse("https://reqres.in/api/users"),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
      );
      if (userProfileResponse.statusCode == 200) {
        return UserModel(
          email: email,
          token: token,
        );
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}

@override
Future<bool> logout() async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  final email = storage.getString('EMAIL');
  final token = storage.getString('TOKEN');
  if (email != null && token != null) {
    await storage.remove('TOKEN');
    await storage.remove('EMAIL');
    return true;
  } else {
    return false;
  }
}
