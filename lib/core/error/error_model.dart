class ErrorModel {
  int statusCode;
  String message;
  ErrorModel({this.statusCode = 400, this.message = 'Bad Request'});
  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> value = json["value"];
    return ErrorModel(
        statusCode: json['statusCode'] ?? 400, message: value["message"]);
  }
}
