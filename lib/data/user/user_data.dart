import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:study_case_vascomm/model/users/users_model.dart';

abstract class ILogin {
  Future<UserModel?> login(String email, String password) async {
    const api = 'https://reqres.in/api/login';
    final data = {"email": email, "password": password};
    final dio = Dio();
    Response response;
    response = await dio.post(api, data: data);
    if (response.statusCode == 200) {
      final body = response.data;
      return UserModel(
        email: email,
        token: body['token'],
        avatar: body['avatar'],
        firstName: body['first_Name'],
        lastName: body['last_Name'],
      );
    } else {
      return null;
    }
  }

  Future<UserModel?> getUser() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final token = storage.getString('TOKEN');
    final email = storage.getString('EMAIL');
    final avatar = storage.getString('AVATAR'); // Add avatar field
    final firstName = storage.getString('FIRST_NAME'); // Add firstName field
    final lastName = storage.getString('LAST_NAME'); // Add lastName field
    if (token != null && email != null) {
      return UserModel(
        email: email,
        token: token,
        avatar: avatar ?? "",
        firstName: firstName ?? "",
        lastName: lastName ?? "",
      );
    } else {
      return null;
    }
  }

  Future<bool> logout() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final email = storage.getString('EMAIL');
    final token = storage.getString('TOKEN');
    if (email != null && token != null) {
      await storage.remove('TOKEN');
      await storage.remove('EMAIL');
      await storage.remove('AVATAR');
      await storage.remove('FIRST_NAME');
      await storage.remove('LAST_NAME');
      return true;
    } else {
      return false;
    }
  }
}
