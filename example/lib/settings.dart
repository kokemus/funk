import 'package:flutter/widgets.dart';
import 'package:funk/funk.dart';

class SettingsSubScreen extends StatelessWidget {
  const SettingsSubScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Content(padding: EdgeInsets.all(8.0), child: Column(              
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,              
      children: [
        Text('choose apperance', style: FunkTheme.of(context).theme.title),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Select(
              label: 'blackAndWhite',
              value: FunkTheme.of(context).mode == ThemeMode.blackAndWhite, 
              onChanged: (value) => FunkTheme.of(context).mode = ThemeMode.blackAndWhite,
            ),
            Select(
              label: 'whiteAndBlack', 
              value: FunkTheme.of(context).mode == ThemeMode.whiteAndBlack, 
              onChanged: (value) => FunkTheme.of(context).mode = ThemeMode.whiteAndBlack,
            ),
          ],
        ),
      ],
    ));
  }
}