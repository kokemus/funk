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
            pageBuilder: (context, animation, secondaryAnimation) {
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

class FunkApp extends StatefulWidget {
  const FunkApp({
    Key key,
    this.navigatorKey,
    this.home,
    this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    this.color,
    this.theme,
    this.darkTheme,
    this.highContrastTheme,
    this.highContrastDarkTheme,
    this.themeMode = ThemeMode.blackAndWhite,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final Widget home;
  final Map<String, WidgetBuilder> routes;
  final String initialRoute;
  final RouteFactory onGenerateRoute;
  final InitialRouteListFactory onGenerateInitialRoutes;
  final RouteFactory onUnknownRoute;
  final List<NavigatorObserver> navigatorObservers;
  final TransitionBuilder builder;
  final String title;
  final GenerateAppTitle onGenerateTitle;
  final ThemeData theme;
  final ThemeData darkTheme;
  final ThemeData highContrastTheme;
  final ThemeData highContrastDarkTheme;
  final ThemeMode themeMode;
  final Color color;
  final Locale locale;
  final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates;
  final LocaleListResolutionCallback localeListResolutionCallback;
  final LocaleResolutionCallback localeResolutionCallback;
  final Iterable<Locale> supportedLocales;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;
  final Map<LogicalKeySet, Intent> shortcuts;
  final Map<Type, Action<Intent>> actions;
  final String restorationScopeId;
  final bool debugShowMaterialGrid;

  @override
  State<StatefulWidget> createState() => _FunkAppState();
}

class _FunkAppState extends State<FunkApp> {
  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      key: GlobalObjectKey(this),
      navigatorKey: widget.navigatorKey,
      navigatorObservers: widget.navigatorObservers,
      home: widget.home,
      routes: widget.routes,
      initialRoute: widget.initialRoute,
      onGenerateRoute: widget.onGenerateRoute,
      onGenerateInitialRoutes: widget.onGenerateInitialRoutes,
      onUnknownRoute: widget.onUnknownRoute,
      title: widget.title,
      onGenerateTitle: widget.onGenerateTitle,
      textStyle: TextStyle(color: Colors.grey, fontSize: 14 ),
      color: Colors.grey,
      locale: widget.locale,
      localizationsDelegates: widget.localizationsDelegates,
      localeResolutionCallback: widget.localeResolutionCallback,
      localeListResolutionCallback: widget.localeListResolutionCallback,
      supportedLocales: widget.supportedLocales,
      showPerformanceOverlay: widget.showPerformanceOverlay,
      checkerboardRasterCacheImages: widget.checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: widget.checkerboardOffscreenLayers,
      showSemanticsDebugger: widget.showSemanticsDebugger,
      debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
      shortcuts: widget.shortcuts,
      actions: widget.actions,
      restorationScopeId: widget.restorationScopeId,
    );
  }
}