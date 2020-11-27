import 'package:flutter/widgets.dart';

import 'button.dart';
import 'theme.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    Key key,
    this.label = '',
    this.controller,
    this.focusNode,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted
  }) : super(key: key);

  final String label;
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onSubmitted;

  @override
  State<StatefulWidget> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  TextEditingController _controller;
  FocusNode _focusNode;
  String _query = '';

  @override
  void initState() {
     _controller = widget.controller ?? TextEditingController();
     _focusNode = widget.focusNode ?? FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 8.0, top: 8.0),
          child: Text(widget.label, style: FunkTheme.of(context).theme.subTitle,)
        ),
        Container(
          height: 52,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: EditableText(
                    onChanged: (value) {
                      setState(() {
                        _query = value;
                      });
                    },
                    onSubmitted: print,
                    backgroundCursorColor: FunkTheme.of(context).theme.color,
                    controller: _controller,
                    cursorColor: FunkTheme.of(context).theme.color,
                    focusNode: _focusNode,
                    style: FunkTheme.of(context).theme.title,
                  ),
                ),
              ),
              if (_query.isNotEmpty)
                Button(label: 'c', onPressed: () { 
                  _controller.clear(); 
                  setState(() {
                    _query = '';
                  });                  
                },)
            ],
          ),
        ),
        Container(height: 1, width: double.infinity, color: FunkTheme.of(context).theme.color)
      ], 
    );
  }
}