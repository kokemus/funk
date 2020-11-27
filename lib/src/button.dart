import 'package:flutter/widgets.dart';
import 'package:funk/funk.dart';

class Button extends StatefulWidget {
  const Button({
    Key key,
    @required this.onPressed,
    @required this.label,
  }) : super(key: key);

  final String label;
  final VoidCallback onPressed;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _isTapDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        child: Text(widget.label, style: FunkTheme.of(context).theme.button.copyWith(
          color: _isTapDown ? Colors.grey : FunkTheme.of(context).theme.button.color),
        )
      ),
      onTapDown: (_) {
        setState(() {
          _isTapDown = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isTapDown = false;
        });        
        widget?.onPressed();
      },
    );
  }
}