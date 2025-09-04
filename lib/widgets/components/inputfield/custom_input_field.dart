import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/colors.dart';
import '../../../utils/typography.dart';

class CustomInputField extends StatelessWidget { // 1. Changed to StatelessWidget
  final TextEditingController controller;
  final String label;
  final Color labelColor;
  final String placeholder;
  final bool obscureText; // Simplified from isPassword
  final TextInputType? keyboardType; // Simplified from isNumeric
  final Function(String)? onTextChanged;
  final IconData? leadingIcon;
  final List<TextInputFormatter>? inputFormatters;
   final VoidCallback? onTap;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final Widget? suffixIcon; // Simplified from IconButton?
  final double height;
  final Color textColor;
  final bool readOnly;
  final int maxLines;
  final FormFieldValidator<String>? validator;

  const CustomInputField({
    super.key,
    required this.controller,
    this.label = '',
    this.labelColor = Colors.black,
    this.placeholder = '',
    this.height = 40,
    this.obscureText = false,
    this.keyboardType,
    this.onTextChanged,
    this.leadingIcon,
    this.inputFormatters,
    this.onTap,
    this.focusNode,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.textColor = Colors.black,
    this.readOnly = false,
    this.maxLines = 1,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty)
          Text(
            label,
            style: tTextStyle600.copyWith(
              color: labelColor,
              fontSize: 16,
            ),
          ),
        const SizedBox(height: 6),
        // 2. Switched to TextFormField to support validation
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          onChanged: onTextChanged,
          onFieldSubmitted: onFieldSubmitted,
          obscureText: obscureText,
          keyboardType: keyboardType,
          readOnly: readOnly,
          maxLines: maxLines,
          style: tTextStyleRegular.copyWith(fontSize: 16, color: textColor),
          cursorColor: Colors.black,
          inputFormatters: inputFormatters,
          // 3. Pass the validator directly to the TextFormField
          validator: validator,
          onTap: onTap,
          decoration: InputDecoration(
            // Use constraints to control height for multiline fields
            constraints: BoxConstraints(minHeight: height),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            prefixIcon: leadingIcon != null ? Icon(leadingIcon, size: size.width*0.04,) : null,
            prefixIconColor: ColorPack.iconGrey,
          
            hintText: placeholder,
            hintStyle: hintTextStyle.copyWith(color: ColorPack.black.withOpacity(0.5), fontSize: size.width*0.035),
            suffixIcon: suffixIcon,
            
            // --- Border Styling ---
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorPack.iconOrange, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorPack.iconOrange, width: 2.0),
            ),

            // --- 4. Error Styling ---
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red, width: 2.0),
            ),
            // Optional: style for the error text itself
            errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
          ),
        ),
      ],
    );
  }
}