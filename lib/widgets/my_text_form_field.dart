import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFormField extends StatelessWidget {
  MyTextFormField({
    Key? key,
    required this.controller,
    this.hingText,
    required this.radius,
    required this.obscureText,
    this.maxLines,
    this.validator,
    this.inputFormatter,
    this.suffixIcon,
    this.onChanged,
    this.onTap,
    this.textInputType,
    this.textInputAction,
    required this.preffixText,
    this.style,
    this.preffixIcon,
    this.editable,
  }) : super(key: key);

  TextEditingController controller = TextEditingController();
  String? hingText;
  double radius;
  bool obscureText;
  int? maxLines;
  FormFieldValidator<String>? validator;
  late List<TextInputFormatter>? inputFormatter;
  Widget? suffixIcon;
  Function(String)? onChanged;
  Function()? onTap;
  TextInputType? textInputType;
  TextInputAction? textInputAction;
  String preffixText;
  TextStyle? style;
  Widget? preffixIcon;
  late bool? editable;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      inputFormatters: inputFormatter,
      validator: validator,
      maxLines: maxLines,
      obscureText: obscureText,
      controller: controller,
      onTap: onTap,
      style: style,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        enabled: editable??true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(
            color: Colors.indigo,
            width: 0.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: Colors.blue, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          ),
        suffixIcon: suffixIcon,
        prefixIcon: preffixText.isNotEmpty?Container(
          padding: const EdgeInsets.only(bottom: 2),
          alignment: Alignment.centerRight,
          width: 20,
          child: Text(
            preffixText,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
            // style: AppStyle.editText,
          ),
        ):null,
        hintText: hingText.toString(),
      ),
      onChanged: onChanged,
    );
  }

  // Widget customMaskTextField({
  //   required TextEditingController controller,
  //   keyboardType,
  //   prefixText,
  //   inputAction,
  //   required FocusNode currentFocus,
  //   autofocus,
  //   hintText,
  //   nextFocus,
  //   onTap,
  //   errorText,
  //   showError,
  //   onChanged,
  //   maskFormatter,
  //   padding,
  // }) {
  //   return TextFormField(
  //     style: AppStyle.editText,
  //     controller: controller,
  //     focusNode: currentFocus,
  //     autofocus: true,
  //     onTap: onTap,
  //     textCapitalization: TextCapitalization.sentences,
  //     onChanged: onChanged,
  //     textInputAction: inputAction,
  //     inputFormatters: [maskFormatter],
  //     decoration: InputDecoration(
  //       contentPadding: EdgeInsets.symmetric(vertical: getHeight(16), horizontal: getWidth(16)),
  //       filled: true,
  //       fillColor: AppColor.background,
  //       prefixIcon: Container(
  //         padding: EdgeInsets.only(bottom: getHeight(3)),
  //         alignment: Alignment.centerRight,
  //         width: getWidth(20),
  //         child: Text(
  //           prefixText,
  //           style: AppStyle.editText,
  //         ),
  //       ),
  //       hintStyle: AppStyle.telephoneTextStyleSecond,
  //       suffixIcon: Visibility(
  //         visible: currentFocus.hasFocus && controller.text.isNotEmpty,
  //         child: Container(
  //           height: getProportionateScreenHeight(24),
  //           width: getProportionateScreenWidth(24),
  //           child: Center(
  //             child: GestureDetector(
  //                 child: Container(
  //                   child: Icon(
  //                     Icons.close,
  //                     size: getProportionateScreenHeight(20),
  //                     color: Colors.yellow,
  //                   ),
  //                 ),
  //                 onTap: () {
  //                   onChanged('');
  //                   controller.clear();
  //                 }),
  //           ),
  //         ),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(getProportionateScreenWidth(8)),
  //         borderSide: BorderSide(
  //           color: Colors.yellow,
  //           width: 0.5,
  //         ),
  //       ),
  //       enabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(getProportionateScreenWidth(8)),
  //         borderSide: BorderSide(color: Colors.grey, width: 0.5),
  //       ),
  //       errorBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(getProportionateScreenWidth(8)),
  //         borderSide: BorderSide(color: Colors.red, width: 0.5),
  //       ),
  //       errorText: showError ? errorText : null,
  //     ),
  //     cursorColor: Colors.yellow,
  //     keyboardType: keyboardType,
  //   );
  // }
}
