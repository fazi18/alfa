// import 'package:flutter/material.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomTextField extends StatelessWidget {
//   const CustomTextField({
//     Key key?,
//     required this.controller,
//     this.title = '',
//     this.haveBorder = true,
//     this.maxLines = 1,
//     this.textFontSize = 12,
//     this.icon,
//     this.enable = true,
//     this.keyboardType: TextInputType.text,
//   }) : super(key: key);

//   final String? title;
//   final TextEditingController? controller;
//   final bool? haveBorder;
//   final int? maxLines;
//   final double? textFontSize;
//   final IconData? icon;
//   final bool? enable;
//   final TextInputType? keyboardType;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//             controller: controller,
//             obscureText: false,
//             maxLines: maxLines,
//             keyboardType: keyboardType,
//             textInputAction: TextInputAction.next,
//             decoration: InputDecoration(
//               hintText: title,
//               hintStyle: TextStyle(fontSize: textFontSize),
//               // suffixIcon: Icon(
//               //   Icons.book,color: loginColor,
//               //
//               // ),
//               prefixIcon: Icon(icon ?? null),
//               // focusedBorder: haveBorder ? textFieldsBorder : null,
//               // disabledBorder: textFieldsBorder,
//               contentPadding: EdgeInsets.all(4.0),

//               border: null,
//               labelStyle: TextStyle(
//                 fontSize: textFontSize,
//               ),
//             ),
//             validator: (String? value) {
//               if (value!.isEmpty) {
//                 return '$title ';
//               }
//               return null;
//             },
//           );
       
//   }
// }
