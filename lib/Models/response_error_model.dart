/*
ResponseErrorModel:
{"code":404,"message":"Error! la cedula V-34980049 no esta registrada en la base de datos."}
*/

class ResponseErrorModel {
  final int code;
  final String message;

  ResponseErrorModel({
    required this.code,
    required this.message,
  });

  factory ResponseErrorModel.fromJson(Map<String, dynamic> json) {
    return ResponseErrorModel(
      code: json['code'],
      message: json['message'],
    );
  }
}
