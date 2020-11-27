import 'package:flutter/widgets.dart';

import 'theme.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: FunkTheme.of(context).theme.color, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(0.0))
      ),
      child: child,
    );
  }
}