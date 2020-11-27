import 'package:flutter/widgets.dart';

import 'button.dart';

class ActionBar extends StatelessWidget {
  const ActionBar({
    Key key,
    this.actions = const <Widget>[]
    ,
  }) : super(key: key);

  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56, 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (Navigator.of(context).canPop())
            Button(label: 'back', onPressed: () { Navigator.of(context).pop(); },),          
          Container(),
          Row(
            children: actions
          )
        ],
      )
    );
  }
}