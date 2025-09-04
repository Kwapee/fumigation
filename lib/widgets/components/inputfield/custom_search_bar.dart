import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/colors.dart';
import '../../../utils/typography.dart';

class CustomSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final Color labelColor;
  final String placeholder;
  final bool isPassword;
  final bool isError;
  final bool isNumeric;
  final Function onTextChanged;
  final IconData leadingIcon;
  final bool needLeadingIcon;
  final bool boarderNeeded;
  final List<TextInputFormatter>? inputFormatters;
  final dynamic dropdownButton;
  final Function? onTap;
  final FocusNode? inputFocus;
  final ValueChanged<String>? onSubmit;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final bool isSuffixIconNeeded;
  //final double height;
  final Color textColor; // Added textColor property

  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.label,
    required this.labelColor,
    required this.placeholder,
    //required this.height,
    this.isPassword = false,
    this.isError = false,
    this.isNumeric = false,
    required this.onTextChanged,
    this.leadingIcon = Icons.search,
    this.boarderNeeded = true,
    this.needLeadingIcon = false,
    this.inputFormatters,
    this.dropdownButton,
    this.onTap,
    this.inputFocus,
    this.onSubmit,
    this.suffixIcon,
    required this.prefixIcon,
    this.isSuffixIconNeeded = false,
    required this.textColor, // Initialize textColor property
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  bool _obscureText = true;
  dynamic dropDownButton;
  FocusNode customeCreated = FocusNode();

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label.isNotEmpty)
          Text(widget.label,
              style: tTextStyle600.copyWith(
                  color: widget.labelColor, fontSize: 16)),
        const SizedBox(
          height: 6,
        ),
        SizedBox(
          height: 35,
          width: double.infinity,
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            focusNode: widget.inputFocus ?? customeCreated,
            onChanged: (str) {
              widget.onTextChanged(str);
            },
            onSubmitted: widget.onSubmit ??
                (String value) {
                  print('Submitted: $value');
                },
            obscuringCharacter: '*',
            cursorColor: Colors.black,
            style: tTextStyleRegular.copyWith(fontSize: 16, color: widget.textColor), // Apply textColor here
            controller: widget.controller,
            obscureText: widget.isPassword && _obscureText,
            keyboardType:
                widget.isNumeric ? TextInputType.number : TextInputType.text,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              prefixIcon:
                  widget.prefixIcon,
              prefixIconColor: ColorPack.iconGrey,
              filled: true,
             
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: ColorPack.darkGray, // Set border color to black
                  width: 1.5,
                ),
              ),
              focusColor: Colors.red,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: ColorPack.black), // Set border color to black
              ),
              hintText: widget.placeholder,
              hintStyle: hintTextStyle.copyWith(
                fontSize: size.width*0.035,
                color: widget.isError ? Colors.red : ColorPack.black,
              ),
              suffixIcon: widget.suffixIcon
            ),
            inputFormatters: widget.inputFormatters,
          ),
        ),
      ],
    );
  }
}