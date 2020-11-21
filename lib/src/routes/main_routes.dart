import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/animated_container.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getAplicationMainRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext contex) => HomePage(),
    'alert': (BuildContext contex) => AlertPage(),
    'avatar': (BuildContext contex) => AvatarPage(),
    'card': (BuildContext contex) => CardPage(),
    'animatedContainer': (BuildContext contex) => AnimatedContainerPage(),
  };
}
