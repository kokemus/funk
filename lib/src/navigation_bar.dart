import 'package:flutter/widgets.dart';

import 'theme.dart';

class NavigationBarItem {
  NavigationBarItem({
    @required this.label
  });

  final String label;
}

class NavigationBar extends StatefulWidget {
  const NavigationBar({
    Key key,
    this.items = const <NavigationBarItem>[], 
    this.currentIndex = 0,  
    this.onTap,
  }): super(key: key);

  final List<NavigationBarItem> items;
  final ValueChanged<int> onTap;
  final int currentIndex;

  @override
  State<StatefulWidget> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {  
  int _currentIndex = 0;

  @override
  void initState() {
    _currentIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (var i = 0; i < widget.items.length; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = i;
                  });
                  widget.onTap(i);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _currentIndex == i
                    ? Text(widget.items[i].label.toUpperCase(), style: FunkTheme.of(context).theme.heading6,)
                    : Text(widget.items[i].label.toLowerCase(), style: FunkTheme.of(context).theme.subTitle,)
                ),
              ),
          ]
        ),
      )
    );
  }
}