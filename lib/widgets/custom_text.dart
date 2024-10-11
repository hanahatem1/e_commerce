import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
   customTextField({super.key,required this.hintText,this.onChanged,this.obscureText=false});

 Function(String)? onChanged;
 String hintText;
 bool obscureText;
  @override
   Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (data){
        if(data!.isEmpty){
          return 'this field is required';
        }
      },
      onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hintText,
                fillColor: Color(0xFFE9E3E2),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                   borderSide: BorderSide(color:Color(0xFFE9E3E2)),
                )
              ),
            );
        
   }
}