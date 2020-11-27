import 'package:flutter/widgets.dart';
import 'package:funk/funk.dart';

class TextSubScreen extends StatelessWidget {
  const TextSubScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Content(
      padding: const EdgeInsets.all(8.0),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Heading 1', style: FunkTheme.of(context).theme.heading1),
        Text('Heading 2', style: FunkTheme.of(context).theme.heading2),
        Text('Heading 3', style: FunkTheme.of(context).theme.heading3),
        Text('Heading 4', style: FunkTheme.of(context).theme.heading4),
        Text('Heading 5', style: FunkTheme.of(context).theme.heading5),
        Text('Heading 6', style: FunkTheme.of(context).theme.heading6),
        Text('Title', style: FunkTheme.of(context).theme.title),
        Text('Subtitle', style: FunkTheme.of(context).theme.subTitle),
        Text('Body', style: FunkTheme.of(context).theme.body),
      ],
    ));
  }
}
