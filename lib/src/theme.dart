import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Colors {
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const grey = Color(0xFF888888);
}

enum ThemeMode {
  blackAndWhite,
  whiteAndBlack
}

class ThemeData {
  final Color color;
  final Color backgroundColor;
  final Color accentColor;
  final TextStyle heading1;
  final TextStyle heading2;
  final TextStyle heading3;
  final TextStyle heading4;
  final TextStyle heading5;
  final TextStyle heading6;
  final TextStyle title;
  final TextStyle subTitle;
  final TextStyle body;
  final TextStyle button;

  ThemeData({
    this.color = Colors.black,
    this.backgroundColor = Colors.white,
    this.accentColor,
    TextStyle heading1,
    TextStyle heading2,
    TextStyle heading3,
    TextStyle heading4,
    TextStyle heading5,
    TextStyle heading6,
    TextStyle title,
    TextStyle subTitle,
    TextStyle body,
    TextStyle button,
  }): this.heading1 = TextStyle(fontSize: 48, color: color),
    this.heading2 = TextStyle(fontSize: 40, color: color),
    this.heading3 = TextStyle(fontSize: 32, color: color),
    this.heading4 = TextStyle(fontSize: 28, color: color),
    this.heading5 = TextStyle(fontSize: 24, color: color),
    this.heading6 = TextStyle(fontSize: 20, color: color),
    this.title = TextStyle(fontSize: 18, color: color),
    this.subTitle = TextStyle(fontSize: 16, color: Colors.grey),
    this.body = TextStyle(fontSize: 14, color: color),
    this.button = TextStyle(fontSize: 18, decoration: TextDecoration.underline, color: color);    

  static ThemeData blackAndWhite({Color accentColor}) => 
    ThemeData(accentColor: accentColor);
  static ThemeData whiteAndBlack({Color accentColor}) => 
    ThemeData(accentColor: accentColor, color: Colors.white, backgroundColor: Colors.black);
}

class _FunkTheme extends InheritedWidget {
  final FunkThemeState state;

  _FunkTheme({this.state, Widget child}): super(child: child);

  @override
  bool updateShouldNotify(covariant _FunkTheme oldWidget) => true;
}

class FunkTheme extends StatefulWidget {
  FunkTheme({this.accentColor = const Color(0xFF078080), this.theme, this.child});

  final Color accentColor;
  final ThemeData theme;
  final Widget child;

  static FunkThemeState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_FunkTheme>().state;
  }

  @override
  State<StatefulWidget> createState() => FunkThemeState();
}

class FunkThemeState extends State<FunkTheme> {
  ThemeData _theme;

  ThemeData get theme => _theme;
  set theme(value) => _theme = value;

  ThemeMode _mode;

  ThemeMode get mode => _mode;
  set mode(value) {
    setState(() {
      _mode = value;
      _theme = _mode == ThemeMode.whiteAndBlack 
        ? ThemeData.whiteAndBlack(accentColor: widget.accentColor) 
        : ThemeData.blackAndWhite(accentColor: widget.accentColor);
    });    
  } 

  void toggle() {
    mode = mode == ThemeMode.whiteAndBlack ? ThemeMode.blackAndWhite : ThemeMode.whiteAndBlack;
  }

  @override
  void initState() {
    _theme = widget.theme ?? ThemeData.blackAndWhite(accentColor: widget.accentColor);
    _mode = ThemeMode.blackAndWhite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _mode == ThemeMode.blackAndWhite 
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark,
      child: _FunkTheme(state: this, child: widget.child)
    );
  }
}