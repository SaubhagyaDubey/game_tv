import 'package:flutter/material.dart';
import 'package:game_tv/resources/colors.dart';

class CommonTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String errorText;
  final bool isObscure;
  CommonTextField({
    @required this.label,
    this.controller,
    this.isObscure,
    this.errorText,
  });
  @override
  _CommonTextFieldState createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  var errorText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscuringCharacter: '○',
      controller: widget.controller,
      obscureText: widget.isObscure,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: kPrimaryWhite,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: kPrimaryWhite, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: kPrimaryWhite, width: 1.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: kPrimaryWhite, width: 1.0),
        ),
        labelText: widget.label,
        labelStyle: TextStyle(color: kPrimaryWhite, letterSpacing: 0),
        errorText:errorText,
      ),
      style: TextStyle(
          color: kPrimaryWhite, letterSpacing: widget.isObscure ? 4 : null),
      onChanged: (value){
        if(3>value.length||8<=value.length){
          setState(() {
            errorText = widget.errorText;
          });}
          else{
            setState(() {
              errorText = null;
            });
        }
      },
    );
  }
}
