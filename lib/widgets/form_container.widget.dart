import 'package:flutter/material.dart';

class FormContainerWidget extends StatelessWidget {
  final Widget child;

  const FormContainerWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height * 0.05;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(15),
          // height: 300,
          decoration: _createBoxShape(),
          child: this.child),
    );
    // return Container(
    //           //  width: double.infinity,
    //           height: 250,

    //            margin: EdgeInsets.only(left: 15, right: 15, bottom: 0),
    //            padding: EdgeInsets.only( left: 15 , right: 15),
    //           decoration: _createBoxShape(),
    //          // color: Colors.red,

    //            child: this.child

    //         );
  }

  BoxDecoration _createBoxShape() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
      );
}
