import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  final double size;
  final Widget child;
  const RoundedButton(this.size, this.child);

  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size,
      width: widget.size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.size / 2),
        border: Border.all(
          color: Color.fromARGB(228,14,7,26),
          width: 3.0
        ),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.blue[900]!,    
            Colors.blue[300]!,
          ]
        )
      ),
      child: Center(child: widget.child),
    );
  }
}