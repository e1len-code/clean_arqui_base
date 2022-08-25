import 'dart:convert';
import 'dart:developer';

import 'package:clean_arqui_base/core/error/failures.dart';
import 'package:clean_arqui_base/core/global/url_constants.dart';
import 'package:clean_arqui_base/core/network/headers.dart';
import 'package:clean_arqui_base/core/network/network_info.dart';
import 'package:clean_arqui_base/feature/auth/domain/entities/auth.dart';
import 'package:clean_arqui_base/feature/auth/domain/entities/loginParams.dart';
import 'package:clean_arqui_base/injections.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteData {
  Future<Auth> login(LoginParams logParams);
}

class AuthRemoteDataImple extends AuthRemoteData {
  final http.Client client;
  AuthRemoteDataImple({required this.client});
  @override
  Future<Auth> login(LoginParams logParams) async {
    final loginParamsJson = jsonEncode(logParams.toJson());
    final uri = Uri.parse('${sl<NetworkInfo>().url}/api/login');
    final response = await client
        .post(uri, headers: sl<Headers>().headers, body: loginParamsJson)
        .timeout(const Duration(seconds: timeout),
            onTimeout: () => throw TimeOutFailure());
    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      return Auth.fromJson(responseBody);
    } else {
      throw ApiResponseFailure(message: response.statusCode);
    }
  }
}
