/****
 * Integrantes
 - Cesar Acjota Merma
 - Andre Guevara Layme
 - Nicole Puma Zapata
 - Romulo Huaman Cusi
 - Juan Lazaro Mayta
****/
import 'package:flutter/material.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lab12/src/pages/alert_page.dart';
import 'package:lab12/src/pages/avatar_page.dart';
import 'package:lab12/src/pages/home_page.dart';
import 'package:lab12/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: ( RouteSettings settings ){
        print( 'Ruta llamda: ${ settings.name }' );
        return MaterialPageRoute(
          builder: ( BuildContext context ) => AlertPage()
        );
      },
    );
  }
}