import 'package:crud_empleado/domain/modelos/empleados.dart';
import 'package:flutter/material.dart';

class Textos extends StatelessWidget {
  const Textos({
    Key? key,
    required this.gestionTextos,
    required this.etiqueta
  }) : super(key: key);

  final TextEditingController gestionTextos;
  final String etiqueta;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        controller: gestionTextos,
        decoration: InputDecoration(
          filled: true,
          labelText: etiqueta,
          suffix: GestureDetector(
            child: const Icon(Icons.close),
            onTap: () {
              gestionTextos.clear();
            },
          )
        ),
      ),
    );
  }
}