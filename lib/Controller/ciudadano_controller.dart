/*
Obtiene los datos del ciudadano usando el api de la ciudadania.
apiUrl = https://apive.herokuapp.com/api/v1/${cedula}
Retorna los datos y los pasa al modelo ciudadano.dart

String Cedula debe ser mayor a 6 caracteres.
*/
import 'dart:convert';

import 'package:apive/Models/ciudadano_model.dart';
import 'package:apive/Models/response_error_model.dart';
import 'package:http/http.dart' as http;

class CiudadanoController {
  final String apiUrl = 'https://apive.herokuapp.com/api/v1/v/';
  //obtener datos del ciudadano usando el api de la ciudadania En ResponseModel
  Future<Ciudadano> getCiudadano(String cedula) async {
    if (cedula.length < 6) {
      throw 'Cedula debe ser mayor a 6 caracteres.';
    }
    final response = await http.get(Uri.parse('$apiUrl$cedula'));
    if (response.statusCode == 200) {
      return Ciudadano.fromJson(json.decode(response.body));
    } else {
      throw ResponseErrorModel.fromJson(json.decode(response.body));
    }
  }
}
