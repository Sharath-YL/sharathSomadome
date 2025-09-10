// import 'package:flutter/material.dart';

// class BorderedButton extends StatelessWidget {
//   final String text;
//   final IconData icon; 
//   final VoidCallback onPressed;
//   final Color borderColor;
//   final Color textColor;
//   final double borderRadius;
//   final double paddingVertical;

//   const BorderedButton({
//     super.key,
//     required this.text,
//     required this.icon,
//     required this.onPressed,
//     this.borderColor = Colors.grey,
//     this.textColor = Colors.black,
//     this.borderRadius = 12,
//     this.paddingVertical = 14,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity, 
//       child: InkWell(
//         onTap: onPressed,
//         borderRadius: BorderRadius.circular(borderRadius),
//         child: Container(
//           padding: EdgeInsets.symmetric(vertical: paddingVertical, horizontal: 16),
//           decoration: BoxDecoration(
//             border: Border.all(color: borderColor, width: 1.5),
//             borderRadius: BorderRadius.circular(borderRadius),
//           ),
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
           
//               Text(
//                 text,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: textColor,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),

              
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Icon(icon, color: textColor, size: 22),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';

class BorderedButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final double borderRadius;
  final double paddingVertical;

  const BorderedButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.borderRadius = 12,
    this.paddingVertical = 14,
  });

  @override
  Widget build(BuildContext context) {
    const Color borderColor = Colors.white;
    const Color contentColor = Colors.white;

    return SizedBox(
      width: double.infinity, // Full width button
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          splashColor: Colors.transparent, // Remove splash
          highlightColor: Colors.transparent, // Remove highlight
          hoverColor: Colors.transparent, // Remove hover effect
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: paddingVertical,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: borderColor, width: 1.5),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Center text
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: contentColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // Leading icon
                Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(icon, color: contentColor, size: 22),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

