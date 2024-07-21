import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, 
    this.textbutton,
    this.ontap,
  });

  String? textbutton;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          width: double.infinity,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Text(
              textbutton!,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
