import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({super.key, this.hinttext, this.onChanged,this.suffixIcon, this.obscureText=false});

  String? hinttext;
  Function(String)? onChanged;
  Icon? suffixIcon;
  bool obscureText ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: TextFormField(
        validator: (data){
          if(data!.isEmpty){
            return 'field must be not empty';
          }
          return null;
        },
        
        onChanged: onChanged,
        obscureText: obscureText,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          hintText: hinttext,
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
