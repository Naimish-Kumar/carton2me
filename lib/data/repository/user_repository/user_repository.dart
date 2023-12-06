import 'dart:convert';

import 'package:carton2me/core/api.dart';
import 'package:carton2me/data/model/user_model/user_model.dart';
import 'package:dio/dio.dart';

class UserRepository {
  final _api = Api();
  Future<UserModel> createAccount(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String phoneNumber,
      required String compnyName,
      required String startDate,
      required String endDate}) async {
    try {
      Response response = await _api.sendRequest.post(
        ApiUrls.createUser,
        data: jsonEncode({
          "first_name": firstName,
          "last_name": lastName,
          "email_address": email,
          "user_password": password,
          "phone_number": int.parse(phoneNumber),
          "company_name": 'xyz compny',
          "start_date": '2023-01-01',
          "end_date": '2024-01-01',
          "date_of_birth": '2001-05-03',
        }),
      );
      ApiResponse apiResponse = ApiResponse.fromResponse(response);
      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      } else {
        return UserModel.fromJson(apiResponse.data);
      }
    } catch (ex) {
      rethrow;
    }
  }

  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await _api.sendRequest.post(
        ApiUrls.loginUser,
        data: jsonEncode({
          "email_address": email,
          "user_password": password,
        }),
      );
      ApiResponse apiResponse = ApiResponse.fromResponse(response);
      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      } else {
        return UserModel.fromJson(apiResponse.data);
      }
    } catch (ex) {
      rethrow;
    }
  }
}
