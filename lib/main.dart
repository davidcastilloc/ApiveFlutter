import 'package:flutter/material.dart';
// import ciudadano controller
import 'package:apive/Controller/ciudadano_controller.dart';

import 'Models/ciudadano_model.dart';

void main() {
  runApp(const ApiveApp());
}

class ApiveApp extends StatelessWidget {
  const ApiveApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ApiVe Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BuscarCiudadanoPorCedulaPage(title: 'ApiVe Demo Home Page'),
    );
  }
}

class BuscarCiudadanoPorCedulaPage extends StatefulWidget {
  const BuscarCiudadanoPorCedulaPage({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  State<BuscarCiudadanoPorCedulaPage> createState() =>
      _BuscarCiudadanoPorCedulaPageState();
}

class _BuscarCiudadanoPorCedulaPageState
    extends State<BuscarCiudadanoPorCedulaPage> {
  Ciudadano? _ciudadano;
  String _cedula = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
          children: [_cedulaInput(), _ciudadanoOut()],
        )));
  }

//Widget for Show data of model Class Ciudadano
  Widget _ciudadanoOut() {
    if (_ciudadano == null) {
      return Container();
    }

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            const Text('Nombres: '),
            Text(_ciudadano!.getNombres),
          ],
        ),
        Row(
          children: <Widget>[
            const Text('Apellido: '),
            Text(_ciudadano!.getApellidos),
          ],
        ),
      ],
    );
  }

//Row Widget for Search Cedula input and IconButtonSearch
  Widget _cedulaInput() {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Cedula',
            ),
            onChanged: (value) {
              _cedula = value;
            },
          ),
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            print('Cedula: $_cedula');
            CiudadanoController().getCiudadano(_cedula).then((ciudadano) {
              setState(() {
                _ciudadano = ciudadano;
              });
            }).catchError((error) {
              print(error.toString());
            });
          },
        ),
      ],
    );
  }
}
