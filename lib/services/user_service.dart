import 'package:dio/dio.dart';
import 'package:flutter_rest_api/model/user_model.dart';

class UserService {

  final Dio _dio = Dio();
  static const _baseUrl = 'https://reqres.in/api';
  static const _users = 'users';

  Future<List<UserModel>> fetchUser() async {
    try {
      final response = await _dio.get(
        '$_baseUrl/$_users',
        queryParameters: {
          'page' : '1',
        }
      );
      if(response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data['data'];
        List<UserModel> users = List.from(data.map((user) => 
          UserModel.fromJson(json: user)));
        return users;
      }
      throw Exception();
    } catch (e) {
      rethrow;
    }

  }
}