import 'package:flutter/widgets.dart';
import 'package:funk/funk.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Screen(
      content: Content(
        title: 'Detail',
        child: Center(child: Text('Detail'))
      ),
      actionBar: ActionBar(actions: [
        Button(label: 'secondary', onPressed: () {  },),
        Button(label: 'hero', onPressed: () {  },),
      ],)
    );
  }
}