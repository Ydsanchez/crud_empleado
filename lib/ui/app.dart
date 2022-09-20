import 'package:crud_empleado/ui/paginas/listar.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crud Empleado',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const ListarEmpleados(),
      debugShowCheckedModeBanner: false,
    );
  }
}