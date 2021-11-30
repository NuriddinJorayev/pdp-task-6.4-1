import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextFieldBuilder extends StatefulWidget {
  final String hint_text;
  final text_controller;
  final icon;
  final bool rotate;
  final bool  format;
  const TextFieldBuilder(this.hint_text, this.text_controller, this.icon, this.rotate, [this.format = false]);

  @override
  _TextFieldBuilderState createState() => _TextFieldBuilderState();
}

class _TextFieldBuilderState extends State<TextFieldBuilder> {
  // +99895 
    var maskFormatter = new MaskTextInputFormatter(mask: '+998 (##) ###-##-##', filter: { "#": RegExp(r'[0-9]') });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40.0,
          child: Center(
            child: TextField(
              style: TextStyle(color: Colors.white60, fontWeight: FontWeight.w700, letterSpacing: 1.5),
              controller: widget.text_controller,
              cursorColor: Colors.white60,
              inputFormatters: widget.format? [maskFormatter] : [MaskTextInputFormatter()],
                      
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.white60, fontWeight: FontWeight.w700),
                border: InputBorder.none,          
                hintText: widget.hint_text,
                prefixIcon: !widget.rotate? 
                Icon(widget.icon, color: Colors.white60) : 
                Transform.rotate(angle: 14.1, child: Icon(widget.icon, color: Colors.white60,),),
                      
              ),
            ),
          ),
        ),
        Container(
          height: 2.8,
          margin: EdgeInsets.symmetric(horizontal: 15.0 ),          
          decoration: BoxDecoration(
            color: Colors.white38,
            borderRadius: BorderRadius.circular(55.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(110),
                offset: Offset(0.0, -1),
                blurRadius: 0.5,
                spreadRadius: 0.5
              )
            ]
          ),
        )
      ],
    );
  }
  
}