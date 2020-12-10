import 'package:flutter/widgets.dart';
import 'package:funk/funk.dart';

import 'detail.dart';
import 'master.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    
    return FunkTheme(
      accentColor: const Color(0xFF3743f7),
      child: WidgetsApp(
        title: 'funk UI Demo',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (RouteSettings settings) {
          return PageRouteBuilder(
            pageBuilder: (_, __, ___) {
            switch (settings.name) {
              case '/detail':
                return DetailScreen();
              case '/':
              default:
                return MasterScreen();
            }
          });
        },
        textStyle: TextStyle(color: Colors.grey, fontSize: 14 ),
        color: const Color(0xFF3743f7),
        initialRoute: '/', 
      ),
    );
  }
}