import 'package:flutter/material.dart';

class   LoginBackgroundWidget extends StatelessWidget {
  final Widget child;

  const   LoginBackgroundWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _BlueBox(),
          _HeaderIcon(),
          child,
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 30),
            child: const Icon(
              Icons.person_pin,
              color: Colors.white,
              size: 100,
            )));
  }
}

class _BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _purpleBackground(),
      child: Stack(
        children: [
          Positioned(child: _Bubble(), top: 90, left: 30),
          Positioned(child: _Bubble(), top: -40, left: -30),
          Positioned(child: _Bubble(), top: -50, right: -20),
          Positioned(child: _Bubble(), bottom: -50, left: 10),
          Positioned(child: _Bubble(), bottom: 120, right: 20),
          Positioned(child: _Bubble(), bottom: -10, right: -30),
        ],
      ),
    );
  }

  BoxDecoration _purpleBackground() => const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(33, 132, 195, 1), // #2184c3
          Color.fromRGBO(26, 175, 77, 1), // #1aaf4d
        ]),
      );
}

// const Color(0x2184c3)

// class _Bubble extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 100,
//       height: 100,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(100),
//         color: Color.fromRGBO(2500, 255, 255, 0.05),
//       ),
//       child: Icon(Icons.health_and_safety_outlined,
//           size: 75, color: const Color.fromRGBO(255, 255, 255, 0.05)),
//     );
//   }
// }

class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(2500, 255, 255, 0.07),
      ),
    );
  }
}