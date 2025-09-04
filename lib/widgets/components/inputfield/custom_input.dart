import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/colors.dart';
import '../../../utils/typography.dart';

class CustomInputFieldLight extends StatefulWidget {
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
  final IconButton? suffixIcon;
  final bool isSuffixIconNeeded;
  final double height;
  final Color textColor;
  final bool readOnly; // Add readOnly property here

  const CustomInputFieldLight({
    Key? key, // Added key
    required this.controller,
    required this.label,
    required this.labelColor,
    required this.placeholder,
    required this.height,
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
    this.isSuffixIconNeeded = false,
    required this.textColor,
    this.readOnly = false, // Initialize readOnly property and give it a default value
  }) : super(key: key);

  @override
  State<CustomInputFieldLight> createState() => _CustomInputFieldLightState();
}

class _CustomInputFieldLightState extends State<CustomInputFieldLight> {
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
          height: widget.height,
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
            cursorColor: ColorPack.black,
            style: tTextStyleRegular.copyWith(fontSize: 16, color: widget.textColor),
            controller: widget.controller,
            obscureText: widget.isPassword && _obscureText,
            keyboardType:
                widget.isNumeric ? TextInputType.number : TextInputType.text,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              prefixIcon:
                  widget.needLeadingIcon ? Icon(widget.leadingIcon) : null,
              prefixIconColor: widget.needLeadingIcon
                  ? ColorPack.iconGrey
                  : ColorPack.grayBorder,
              filled: true,
              fillColor: ColorPack.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: widget.isError
                      ? Colors.red
                      : widget.boarderNeeded
                          ? ColorPack.black
                          : ColorPack.black,
                  width: 1.5,
                ),
              ),
              focusColor: Colors.red,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:  BorderSide(color: ColorPack.black, width: 2),
              ),
              hintText: widget.placeholder,
              hintStyle: hintTextStyle.copyWith(
                color: widget.isError ? Colors.red : ColorPack.black,
              ),
              suffixIcon: widget.isPassword || widget.suffixIcon != null
                  ? (widget.suffixIcon ??
                      IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ))
                  : null,
              border: InputBorder.none,
            ),
            inputFormatters: widget.inputFormatters,
            readOnly: widget.readOnly,  // Apply readOnly here!
          ),
        ),
      ],
    );
  }
}