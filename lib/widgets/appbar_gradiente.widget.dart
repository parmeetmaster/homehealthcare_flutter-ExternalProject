import 'package:flutter/material.dart'; 
 

 Widget appbarGradientWidget() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(33, 132, 195, 1), // #2184c3
          Color.fromRGBO(26, 175, 77, 1), // #1aaf4d
        ]),
      ),
    );
  }