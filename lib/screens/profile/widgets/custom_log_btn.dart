import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLogBtn extends StatelessWidget {
  const CustomLogBtn({super.key, required this.text, required this.icon, required this.onClick});
  final String text;
  final IconData icon;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(style: ElevatedButton.styleFrom(backgroundColor: Colors.red),onPressed: onClick, label: Text(text),
    icon:  Icon(icon),);
  }
}
