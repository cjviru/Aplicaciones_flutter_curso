import 'package:aplicacion2/src/pages/animated_container.dart';
import 'package:aplicacion2/src/pages/cards_page.dart';
import 'package:aplicacion2/src/pages/input_page.dart';
import 'package:aplicacion2/src/pages/listview_page.dart';
import 'package:aplicacion2/src/pages/slidder_page.dart';
import 'package:flutter/material.dart';

import '../pages/alert_page.dart';
import '../pages/avatar_page.dart';
import '../pages/home_page.dart';

Map<String, WidgetBuilder>getRutas()
{
  return <String, WidgetBuilder>
      {
         "/"        : (BuildContext context) => HomePage(),
         "alert"    : (BuildContext context) => AlertPage(),
         "avatar"   : (BuildContext context) => AvatarPage(),
         "card"     : (BuildContext context) => CardsPage(),
         "animatedcontainer": (BuildContext context) => AnimacionPage(),
         "inputs"   : (BuildContext context) => InputPage(),
         "slider"   : (BuildContext context) => SlidderPage(),
         "list"     : (BuildContext context) => ListasPage(),

      };
}
