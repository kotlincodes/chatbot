import 'package:flutter/material.dart';

class TextFieldCos extends StatelessWidget {
  final String hintText,text;
  final bool obscureText, enabled;
  final Function onChanged;
  final TextInputType textInputType;
  final int maxlines;
  final TextInputAction textInputAction;
  final Color textColor;
  final String error;
  final Function onEditComplete;


  TextFieldCos(
      {this.onEditComplete,this.error,this.textColor,this.textInputAction,this.maxlines,this.text,@required this.hintText, this.obscureText, this.onChanged, this.enabled,this.textInputType});

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller=text!=null?TextEditingController(text: text):null;
    if(_controller!=null) {
      _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
    }
    OutlineInputBorder outlineInputBorder =  const OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey, width: 0.0),
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
      child: TextField(
        onSubmitted:onEditComplete,
        maxLines: maxlines,
        style: TextStyle(color: textColor),
        keyboardType: textInputType,
        obscureText: obscureText == null ? false : obscureText,
        onChanged: onChanged,
        enabled: enabled != null ? enabled : true,
        controller: _controller!=null?_controller:null,
        textInputAction: textInputAction!=null?textInputAction:TextInputAction.done,
        decoration: new InputDecoration(
//          border: new OutlineInputBorder(
//            borderRadius: const BorderRadius.all(
//              const Radius.circular(10.0),
//            ),
//          ),
          errorText: error,
          labelStyle: TextStyle(color: Colors.grey),
//          enabledBorder: outlineInputBorder,
            labelText: hintText,
            hintStyle: TextStyle(color: Colors.black26),
//            border: outlineInputBorder
        ),
      ),
    );
  }
}