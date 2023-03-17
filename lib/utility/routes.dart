import 'package:flutter/material.dart';

import '../screen/loginPage.dart';
import '../screen/splasPage.dart';

class RouteGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
    /*
        case '':
          var arguments = settings.arguments as Map;
          return MaterialPageRoute(
            builder: (context) => CategoriaPizzaScreen(
              categoria: arguments["categoria"],
            ));
*/
      case Splashpage.routeName:
        return MaterialPageRoute(
          builder: (context) => const Splashpage(),
        );

      case LogInPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const LogInPage(),
        );


      default:
        return MaterialPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}