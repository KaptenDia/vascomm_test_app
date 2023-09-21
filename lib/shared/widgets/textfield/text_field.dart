import 'package:flutter/material.dart';
import 'package:study_case_vascomm/shared/theme/theme_config.dart';

class QTextField extends StatefulWidget {
  final String? id;
  final String title;
  final String label;
  final String? value;
  final String? hint;
  final String? helper;
  final String? Function(String?)? validator;
  final bool obscure;
  final bool enabled;
  final bool titleRow;
  final bool isPassword;
  final bool onTapSuffixIcon;
  final int? maxLength;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;

  const QTextField({
    Key? key,
    required this.label,
    this.id,
    this.value,
    this.validator,
    this.hint,
    this.helper,
    this.maxLength,
    required this.onChanged,
    this.onSubmitted,
    this.obscure = false,
    this.enabled = true,
    this.onTapSuffixIcon = false,
    this.prefixIcon,
    this.suffixIcon,
    this.titleRow = false,
    this.isPassword = false,
    required this.title,
  }) : super(key: key);

  @override
  State<QTextField> createState() => _QTextFieldState();
}

class _QTextFieldState extends State<QTextField> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    textEditingController.text = widget.value ?? "";
    super.initState();
  }

  getValue() {
    return textEditingController.text;
  }

  setValue(value) {
    textEditingController.text = value;
  }

  resetValue() {
    textEditingController.text = "";
  }

  focus() {
    focusNode.requestFocus();
  }

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.titleRow
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    Text(
                      "Lupa password anda ?",
                      style: TextStyle(
                        fontSize: 14,
                        color: primaryColor,
                      ),
                    ),
                  ],
                )
              : Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
          const SizedBox(
            height: 20.0,
          ),
          TextFormField(
            enabled: widget.enabled,
            controller: textEditingController,
            focusNode: focusNode,
            validator: widget.validator,
            maxLength: widget.maxLength,
            obscureText: widget.obscure,
            decoration: InputDecoration(
              labelText: widget.label,
              // suffixIcon: widget.isPassword
              //     ? IconButton(
              //         onPressed: () {
              //           setState(() {
              //             widget.onTapSuffixIcon != widget.onTapSuffixIcon;
              //           });
              //         },
              //         icon: widget.onTapSuffixIcon
              //             ? const Icon(
              //                 Icons.remove_red_eye,
              //               )
              //             : const Icon(
              //                 Icons.remove_red_eye_outlined,
              //               ),
              //       )
              //     : const SizedBox(),
              // suffixIcon: Icon(
              //   widget.suffixIcon ?? Icons.abc,
              // ),
              helperText: widget.helper,
              hintText: widget.hint,
            ),
            onChanged: (value) {
              widget.onChanged(value);
            },
            onFieldSubmitted: (value) {
              if (widget.onSubmitted != null) widget.onSubmitted!(value);
            },
          ),
        ],
      ),
    );
  }
}
