import 'dart:convert';

import 'package:clean_arqui_base/core/error/exceptions.dart';
import 'package:clean_arqui_base/core/error/failures.dart';
import 'package:clean_arqui_base/core/network/headers.dart';
import 'package:clean_arqui_base/core/network/network_info.dart';
import 'package:clean_arqui_base/feature/cuenta/domain/entities/cuenta.dart';
import 'package:clean_arqui_base/injections.dart';
import 'package:clean_arqui_base/core/global/url_constants.dart';
import 'package:http/http.dart' as http;

abstract class CuentaRemoteData {
  Future<List<Cuenta>> list();
  Future<List<Cuenta>> filterCuentas(Cuenta cuenta);
  Future<Cuenta> getCuenta(String codCuenta);
  Future<bool> existCuenta(String codCuenta);
  Future<bool> save(Cuenta cuenta);
  Future<bool> delete(String codCuenta);
}

class CuentaRemoteDataImple extends CuentaRemoteData {
  final http.Client client;
  CuentaRemoteDataImple({required this.client});
  @override
  Future<bool> delete(String codCuenta) async {
    final uri = Uri.parse('${sl<NetworkInfo>().url}/$CUENTA/$codCuenta');
    final response = await client
        .delete(uri, headers: sl<Headers>().headers)
        .timeout(const Duration(seconds: timeout),
            onTimeout: () => throw TimeOutFailure());
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      final _isdeleted = responseJson as int == 2 ? true : false;
      return _isdeleted;
    } else {
      throw ApiResponseException(statusCode: response.statusCode);
    }
  }

  @override
  Future<bool> existCuenta(String codCuenta) async {
    final uri = Uri.parse('${sl<NetworkInfo>().url}/$CUENTA/$codCuenta');
    final response = await client
        .get(uri, headers: sl<Headers>().headers)
        .timeout(const Duration(seconds: timeout),
            onTimeout: () => throw TimeOutFailure());
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      return responseJson as bool;
    } else {
      throw ApiResponseException(statusCode: response.statusCode);
    }
  }

  @override
  Future<List<Cuenta>> filterCuentas(Cuenta cuenta) async {
    cuenta.tipoCuenta == '' ? '*' : cuenta.tipoCuenta;
    final cuentaJson = jsonEncode(cuenta.toJson());
    final url = Uri.parse('${sl<NetworkInfo>().url}/$CUENTA/listar');
    final response = await client
        .post(url, headers: sl<Headers>().headers, body: cuentaJson)
        .timeout(const Duration(seconds: timeout),
            onTimeout: () => throw TimeOutFailure());
    if (response.statusCode == 200) {
      final listJson = jsonDecode(response.body);
      final list =
          listJson.map<Cuenta>((element) => Cuenta.fromJson(element)).toList();
      return list;
    } else {
      throw ApiResponseException(statusCode: response.statusCode);
    }
  }

  @override
  Future<Cuenta> getCuenta(String codCuenta) async {
    codCuenta == '' ? '-' : codCuenta;
    final url = Uri.parse('${sl<NetworkInfo>().url}/$CUENTA/$codCuenta');
    final response = await client
        .get(url, headers: sl<Headers>().headers)
        .timeout(const Duration(seconds: timeout),
            onTimeout: () => throw TimeOutFailure());
    if (response.statusCode == 200) {
      final cuentaJson = jsonDecode(response.body);
      final cuenta = Cuenta.fromJson(cuentaJson);
      return cuenta;
    } else {
      throw ApiResponseException(statusCode: response.statusCode);
    }
  }

  @override
  Future<List<Cuenta>> list() async {
    final url = Uri.parse('${sl<NetworkInfo>().url}/$CUENTA/listar');
    final response = await client.get(url, headers: sl<Headers>().headers);
    if (response.statusCode == 200) {
      final listCuentaJson = jsonDecode(response.body);
      final listCuenta = listCuentaJson
          .map<Cuenta>((element) => Cuenta.fromJson(element))
          .toList();
      return listCuenta;
    } else {
      throw ApiResponseException(statusCode: response.statusCode);
    }
  }

  @override
  Future<bool> save(Cuenta cuenta) async {
    final cuentaJson = jsonEncode(cuenta.toJson());
    final url = Uri.parse('${sl<NetworkInfo>().url}/$CUENTA');
    final response = await client.post(url,
        headers: sl<Headers>().headers, body: cuentaJson);
    if (response.statusCode == 200) {
      final Map<String, dynamic> mapResponse = json.decode(response.body);
      return mapResponse["Key"] as bool;
    } else {
      throw ApiResponseException(statusCode: response.statusCode);
    }
  }
}
