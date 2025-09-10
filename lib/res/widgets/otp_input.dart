// import 'package:flutter/material.dart';

// class OtpInput extends StatelessWidget {
//   final int length;
//   final List<TextEditingController> controllers;
//   final Color fillColor;
//   final Color borderColor;
//   final Color focusedBorderColor;

//   const OtpInput({
//     super.key,
//     required this.length,
//     required this.controllers,
//     this.fillColor = const Color(0xFF2C2C2C),
//     this.borderColor = Colors.transparent,
//     this.focusedBorderColor = Colors.white,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(length, (index) {
//         return Container(
//           margin: const EdgeInsets.symmetric(horizontal: 8),
//           width: 50,
//           height: 50,
//           child: TextField(
//             controller: controllers[index],
//             keyboardType: TextInputType.number,
//             maxLength: 1, // only 1 digit
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 24,
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//             decoration: InputDecoration(
//               counterText: "", // hides counter
//               filled: true,
//               fillColor: fillColor,
//               contentPadding: EdgeInsets.zero,
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide(color: borderColor, width: 0.5),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide(color: focusedBorderColor, width: 0.5),
//               ),
//             ),
//             onChanged: (value) {
//               if (value.isNotEmpty && index < length - 1) {
//                 FocusScope.of(context).nextFocus();
//               }
//               if (value.isEmpty && index > 0) {
//                 FocusScope.of(context).previousFocus();
//               }
//             },
//           ),
//         );
//       }),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final int length;
  final void Function(String)? onCompleted;

  const OtpInput({
    super.key,
    required this.controller,
    this.length = 5,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: const TextStyle(
          fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.transparent),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        border: Border.all(color: Colors.white),
      ),
    );

    return Center(
      child: Pinput(
        length: length,
        controller: controller,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        onCompleted: onCompleted,
      ),
    );
  }
}

