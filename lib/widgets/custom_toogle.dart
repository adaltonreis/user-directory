import 'package:flutter/material.dart';

class CustomToggle extends StatefulWidget {
  final String title;
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const CustomToggle({
    super.key,
    required this.title,
    this.initialValue = false,
    required this.onChanged,
  });

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(widget.title, style: const TextStyle(fontSize: 16)),
      value: _value,
      activeColor: Colors.teal,
      onChanged: (val) {
        setState(() {
          _value = val;
        });
        widget.onChanged(val);
      },
    );
  }
}
