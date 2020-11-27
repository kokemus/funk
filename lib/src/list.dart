import 'package:flutter/widgets.dart';

import 'theme.dart';

class ListTile extends StatelessWidget {
  const ListTile({
    Key key,
    this.title: '',
    this.subTitle: '',
    this.leading,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final Widget leading;
  final Widget trailing;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (leading != null) 
                leading,                
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(      
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: FunkTheme.of(context).theme.title),
                      Text(subTitle, style: FunkTheme.of(context).theme.subTitle),               
                    ],
                  ),
                ),
              ),
              if (trailing != null) 
                trailing,                 
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}

class Divider extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Container(height: 1, width: double.infinity, color: FunkTheme.of(context).theme.color);
  }
}