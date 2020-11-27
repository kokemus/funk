import 'package:flutter/widgets.dart';
import 'package:funk/funk.dart';

class Select extends StatefulWidget {
  const Select({
    Key key,
    @required this.label,
    @required this.value,
    @required this.onChanged,    
  }) : super(key: key);

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  bool _isTapDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: Text(widget.label, style: FunkTheme.of(context).theme.button.copyWith(
          fontWeight: widget.value ? FontWeight.bold : FontWeight.normal,
          color: _isTapDown 
            ? Colors.grey 
            :  widget.value ? FunkTheme.of(context).theme.accentColor:  FunkTheme.of(context).theme.button.color
          ),
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
        widget?.onChanged(!widget.value);
      },
    );
  }
}