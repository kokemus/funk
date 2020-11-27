import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:funk/funk.dart';

void main() {
  test('ThemeData', () {
    final theme = ThemeData(accentColor: Color(0xFF078080));
    expect(theme.color, Colors.black);
    expect(theme.backgroundColor, Colors.white);
    expect(theme.accentColor, Color(0xFF078080));
  });

  test('ThemeData.blackAndWhite', () {
    final theme = ThemeData.blackAndWhite(accentColor: Color(0xFF078080));
    expect(theme.color, Colors.black);
    expect(theme.backgroundColor, Colors.white);
    expect(theme.accentColor, Color(0xFF078080));
  });
}
