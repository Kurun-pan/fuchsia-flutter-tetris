import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'gamer/gamer.dart';
import 'generated/i18n.dart';
import 'panel/page_portrait.dart';
import 'gamer/keyboard.dart';

void main() {
  runApp(MyApp());
}

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tetris',
      localizationsDelegates: [S.delegate, GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate],
      navigatorObservers: [routeObserver],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Game(child: KeyboardController(child: _HomePage())),
      ),
    );
  }
}

const SCREEN_BORDER_WIDTH = 3.0;
const BACKGROUND_COLOR = const Color(0xffefcc19);

class _HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //only Android/iOS support land mode
    bool land = MediaQuery.of(context).orientation == Orientation.landscape;
    return land ? PageLand() : PagePortrait();
  }
}
