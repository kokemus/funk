import 'package:flutter/widgets.dart';

import 'theme.dart';

class Content extends StatelessWidget {
  const Content({
    Key key,
    @required this.child,
    this.padding: const EdgeInsets.all(0),
    this.margin: const EdgeInsets.all(16.0),
    this.title,
  }) : super(key: key);

  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
         mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Container(
              margin: EdgeInsets.only(bottom: 24.0),
              child: Text(title.toLowerCase(), style: FunkTheme.of(context).theme.heading6,)
            ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: padding,
              decoration: BoxDecoration(
                border: Border.all(color: FunkTheme.of(context).theme.color, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(0.0))
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}