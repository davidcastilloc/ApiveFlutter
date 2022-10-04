/* Test apive */
import 'package:flutter_test/flutter_test.dart';

import 'package:apive/Controller/ciudadano_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  const String apiUrlRoot = 'https://apive.herokuapp.com/api/v1/v/';
  //Test ApiVe
  test('test respuesta del api', () async {
    final response = await http.get(Uri.parse('${apiUrlRoot}24980047'));
    expect(json.decode(response.body)['cedula'], 24980047);
  });
  //Test CiudadanoController
  test('test ciudadano controller', () async {
    final ciudadanoController = CiudadanoController();
    final api = await ciudadanoController.getCiudadano('24980047');
    expect(api.getCedula, 24980047);
  });

  //check if the ciudadano is valid json.decode(response.body)['ciudadano']['error'];
  test('test error', () async {
    //fech data from apive
    try {
      final response = await http.get(Uri.parse('${apiUrlRoot}12345678'));
      expect(json.decode(response.body)['message'],
          'Error! la cedula V-12345678 no esta registrada en la base de datos.');
    } catch (e) {
      expect(e,
          'Error! la cedula V-12345678 no esta registrada en la base de datos.');
    }
  });
}
