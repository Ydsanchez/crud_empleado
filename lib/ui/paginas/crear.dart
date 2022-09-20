import 'package:crud_empleado/domain/modelos/empleados.dart';
import 'package:crud_empleado/ui/paginas/widget.dart';
import 'package:flutter/material.dart';

class CrearEmpleados extends StatefulWidget {
  final Empleado gestionEmpleado;
  const CrearEmpleados({super.key, required this.gestionEmpleado});

  @override
  State<CrearEmpleados> createState() => _CrearEmpleadosState();
}

class _CrearEmpleadosState extends State<CrearEmpleados> {

  final List<Empleado> _addEmpleado = [];

  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlApellido = TextEditingController();
  TextEditingController controlTelefono = TextEditingController();
  DateTime fechaNac = DateTime.now();

  @override

  void initState() {
    controlNombre.text=widget.gestionEmpleado.nombre;
    controlApellido.text=widget.gestionEmpleado.apellido;
    controlTelefono.text=widget.gestionEmpleado.telefono;
    
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adicionar Empleados')
      ),
      body: 
      Column(
        children: [
          Textos(gestionTextos: controlNombre, etiqueta: 'NOMBRES',),
          Textos(gestionTextos: controlApellido, etiqueta: 'APELLIDOS',),
          Textos(gestionTextos: controlTelefono, etiqueta: 'TELEFONO',),
          ElevatedButton(
            onPressed: () {
              _addEmpleado.add(
                Empleado(
                  nombre: controlNombre.text, 
                  apellido: controlApellido.text, 
                  telefono: controlTelefono.text, 
                  fechaNacimiento: fechaNac,
                )
              );
              Navigator.pop(context, _addEmpleado);
            }, child: const Text('Guardar Empleado'),
          )
        ],
      )
    );
  }
}