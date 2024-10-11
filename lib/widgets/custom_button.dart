import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
 customButton({super.key,required this.text,this.onTap});

String text;
VoidCallback? onTap;
  @override
   Widget build(BuildContext context) { 
    return GestureDetector(
      onTap: onTap,
      child: Container(
                decoration: BoxDecoration(
                   color: Colors.green,
                   borderRadius: BorderRadius.circular(8)
                ),
                height: 35,
                width: 65,
                child: Center(child: Text(text,style: TextStyle(color: Colors.white),)),
              ),
    );
   }
}