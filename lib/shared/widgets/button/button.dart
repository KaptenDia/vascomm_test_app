import 'package:flutter/material.dart';
import 'package:study_case_vascomm/shared/theme/theme_config.dart';

class QButton extends StatelessWidget {
  final String label;
  final double? radius;
  final Function onPressed;
  final double? width;
  final IconData? prefixIcon;
  final IconData? sufixIcon;
  final Color? color;
  final Color? textColor;
  final Color? suffixIconColor;
  final bool spaceBetween;

  const QButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.width,
    this.prefixIcon,
    this.sufixIcon,
    this.color,
    this.spaceBetween = false,
    this.textColor,
    this.suffixIconColor,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 12),
          ),
        ),
        onPressed: () => onPressed(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null) ...[
              Icon(
                prefixIcon!,
                size: 24.0,
                color: primaryColor,
              ),
              const SizedBox(
                width: 6.0,
              ),
            ],
            if (spaceBetween && prefixIcon != null) const Spacer(),
            Text(
              label,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: textColor ?? Colors.white,
              ),
            ),
            if (spaceBetween && sufixIcon != null) const Spacer(),
            if (sufixIcon != null) ...[
              Icon(
                sufixIcon!,
                size: 24.0,
                color: suffixIconColor ?? Colors.white,
              ),
              const SizedBox(
                width: 6.0,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
