import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_estados/controllers/usuario_controller.dart';
import 'package:flutter_estados/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.find<UsuarioController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              child: const Text('Establecer Usuario',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioCtrl.cargarUsuario(Usuario(nombre: 'Alan', edad: 30));
                Get.snackbar(
                    'Usuario establecido', 'Alan es el nombre del usuario',
                    backgroundColor: Colors.white,
                    boxShadows: [
                      const BoxShadow(color: Colors.black38, blurRadius: 10)
                    ]);
              }),
          const Divider(),
          MaterialButton(
              child: const Text('Cambiar Edad',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioCtrl.cambiarEdad(25);
              }),
          const Divider(),
          MaterialButton(
              child: const Text('Añadir Profesion',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioCtrl.agregarProfesion(
                    'Profesión #${usuarioCtrl.profesionesCount + 1}');
              }),
          const Divider(),
          MaterialButton(
              child: const Text('Cambiar tema',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                Get.changeTheme(
                    Get.isDarkMode ? ThemeData.dark() : ThemeData.light());
              }),
        ],
      )),
    );
  }
}
