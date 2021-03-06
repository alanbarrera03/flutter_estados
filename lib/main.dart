import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_estados/pages/pagina1_page.dart';
import 'package:flutter_estados/pages/pagina2_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/pagina1',
      // routes: {
      //   'pagina1': (_) => Pagina1Page(),
      //   'pagina2': (_) => Pagina2Page(),
      // },

      getPages: [
        GetPage(name: '/pagina1', page: () => Pagina1Page()),
        // ignore: prefer_const_constructors
        GetPage(name: '/pagina2', page: () => Pagina2Page())
      ],
    );
  }
}
