/*
  Un ciudadano Venezolano es una persona que vive en Venezuela,
  y que tiene los siguientes datos.
  id	: Identificador del ciudadano.
  nacionalidad	: Nacionalidad del ciudadano.
  cedula	: Cédula del ciudadano.
  nombre_completo	: Nombre completo del ciudadano.
  nombres		: Nombres del ciudadano.
  apellidos		: Apellidos del ciudadano.
  estado		: Estado del ciudadano.
  municipio		: Municipio del ciudadano.
  parroquia		: Parroquia del ciudadano.
  centro		: Centro del ciudadano.
  direccion		: Dirección del ciudadano.
*/
class Ciudadano {
  final int cedula;
  final String nombres;
  final String apellidos;
  final String nombreCompleto;
  final String nacionalidad;
  final String estado;
  final String municipio;
  final String parroquia;
  final String centro;
  final String direccion;

  const Ciudadano({
    required this.cedula,
    required this.nombres,
    required this.apellidos,
    required this.nombreCompleto,
    required this.nacionalidad,
    required this.estado,
    required this.municipio,
    required this.parroquia,
    required this.centro,
    required this.direccion,
  });

  factory Ciudadano.fromJson(Map<String, dynamic> json) {
    return Ciudadano(
      cedula: json['cedula'],
      nombres: json['nombres'],
      apellidos: json['apellidos'],
      nombreCompleto: json['nombre_completo'],
      nacionalidad: json['nacionalidad'],
      estado: json['estado'],
      municipio: json['municipio'],
      parroquia: json['parroquia'],
      centro: json['centro'],
      direccion: json['direccion'],
    );
  }

  //Getters
  String get getNacionalidad => nacionalidad;
  int get getCedula => cedula;
  String get getNombres => nombres;
  String get getApellidos => apellidos;
  String get getNombreCompleto => nombreCompleto;
  String get getEstado => estado;
  String get getMunicipio => municipio;
  String get getParroquia => parroquia;
  String get getCentro => centro;
  String get getDireccion => direccion;
}
