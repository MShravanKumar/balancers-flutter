import 'package:balancers/auth_repository/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  static String baseUrl = "http://13.201.115.33/";
  static String dummyToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiOTA2OWJkZjc0NmJkNDUzNjgwMjY2NDNiYWUyZWZhNDEifQ.-m9hhfSWbrz5e5dc4fiWvndKhTeN923H0KDxErz9488";
  final Dio _dio = Dio();
  Future<Map> login(Map<String, dynamic> data) async {
    try {
      String url = baseUrl + ApiConstants.sendSms;
      Response response = await _dio.post(url, data: data);
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (error) {
      debugPrint("send sms error:$error");
    }
    return {};
  }

  Future<Map> verifyMobileNumber(Map<String, dynamic> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String url = baseUrl + ApiConstants.verifyOtp;
      Response response = await _dio.post(url, data: data);
      if (response.statusCode == 200) {
        String token = response.data["token"]["access-token"];

        prefs.setString('tokenId', token);
        return response.data;
      }
    } catch (error) {
      debugPrint("send sms error:$error");
    }
    return {};
  }

  Future<Map> createrUser(Map<String, dynamic> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String url = baseUrl + ApiConstants.createrUser;
      String? token = prefs.getString('tokenId');
      Response response = await _dio.post(url,
          data: data,
          options: Options(
            contentType: "application/json",
            headers: {"authorization": "Bearer $token"},
          ));
      if (response.statusCode == 200) {
        // String token = response.data["token"]["access-token"];

        // prefs.setString('tokenId', token);
        return response.data;
      }
    } catch (error) {
      debugPrint("send sms error:$error");
    }
    return {};
  }
}
