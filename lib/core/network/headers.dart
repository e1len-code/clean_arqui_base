class Headers {
  final Map<String, String> _headers = {
    "Content-Type": "application/json",
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Methods": "DELETE, POST, GET",
    "Access-Control-Allow-Headers":
        "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With"
  };
  String _accessToken = "";
  String _refreshToken = "";

  Map<String, String> get headers => this._headers;

  String get accessToken => _accessToken;
  // String get refreshToken => _refreshToken;

  /* void addHeader(String key, String value) {
    //if (!this._headers.containsKey(key)) {
    if (this.headers.containsKey(key)) deleteHeader(key);
    this._headers[key] = value;
    if (key == "Authorization") {
      _accessToken = value;
    }
    //} else {

    //}
  }

  void deleteHeader(String key) {
    if (this._headers.containsKey(key)) {
      this._headers.removeWhere((k, v) => k == key);
      if (key == "Authorization") {
        _accessToken = "";
      }
    }
  }

  set refreshToken(String _token) {
    if (_token.trim() != '') {
      _refreshToken = _token;
    }
  }

  Future<void> getRefreshToken() async {
    if (!(await _isRefreshTokenExpired())) {
      final uri = Uri.parse('${sl<NetworkInfo>().url}/$AUTH/Refresh_Token');

      final refreshToken = jsonEncode({'refreshToken': _refreshToken});
      final response = await http
          .post(uri, headers: this.headers, body: refreshToken)
          .timeout(Duration(seconds: timeout),
              onTimeout: () => throw TimeOutException());

      if (response.statusCode == 200) {
        final authJson = jsonDecode(response.body);
        final auth = AuthModel.fromJson(authJson);
        deleteHeader('Authorization');
        sl<Headers>().addHeader('Authorization', 'bearer ${auth.token}');
        sl<Headers>()._refreshToken = auth.refreshToken;
        /* final authJson = jsonDecode(response.reasonPhrase!);
      final authModel = AuthModel.fromJson(authJson); */
        //return authModel;
        //return true;
      } else {
        //generaly the api is sending a status code 400 bad request
        //final errorJson = jsonDecode(response.body);
        final error = /* ErrorModel.fromJson(errorJson); */ ErrorModel(
            statusCode: response.statusCode,
            message: 'Error al recuperar refresf token');
        throw ApiResponseException(
            statusCode: error.statusCode, message: error.message);
      }
    } else {
      sl<AuthRepository>().verifyLogin();
    }
  }

  Future<void> validateToken() async {
    try {
      var a = Jwt.isExpired(accessToken, 'token');
      if (a) {
        //refreshToken
        //deleteHeader('Authorization');
        await getRefreshToken();
      }
    } catch (e) {
      throw ServerException(message: "refresh Token error");
    }
  }

  Future<bool> _isRefreshTokenExpired() async {
    try {
      return Jwt.isExpired(_refreshToken, 'tokenRefresh');
    } catch (e) {
      return false;
    }
  } */
}
