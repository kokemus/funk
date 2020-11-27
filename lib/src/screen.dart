import 'package:flutter/widgets.dart';

import 'theme.dart';

class Screen extends StatelessWidget {
  const Screen({
    Key key,
    Widget navigationBar,
    Widget content,
    Widget actionBar,
  }) : 
    this.navigationBar = navigationBar,
    this.content = content,
    this.actionBar = actionBar,
    super(key: key);

  final Widget navigationBar;
  final Widget content;
  final Widget actionBar;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: FunkTheme.of(context).theme.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (navigationBar != null) navigationBar,
            Expanded(child: content),
            if (actionBar != null) actionBar,
          ],
        )
      ),
    );
  }
}