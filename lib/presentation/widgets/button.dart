import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onTap,
    required this.title,
    this.loadingText,
    this.buttonColor,
    this.borderColor,
    this.textColor,
    this.borderRadius,
    this.hPadding,
    this.vPadding,
    this.allowSubmit = true,
    this.isLoading = false,
  });

  final String title;
  final String? loadingText;
  final void Function() onTap;
  final Color? buttonColor, borderColor;
  final Color? textColor;
  final double? borderRadius, hPadding, vPadding;
  final bool allowSubmit, isLoading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Access theme data

    return InkWell(
      onTap: allowSubmit ? onTap : null,
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor ??
              (allowSubmit ? theme.primaryColor : theme.disabledColor),
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          // border: Border.all(
          //   color: borderColor ??
          //       (allowSubmit ? theme.primaryColor : theme.disabledColor),
          // ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: hPadding ?? 30.0,
            vertical: vPadding ?? 16.0,
          ),
          child: Center(
            child: isLoading && loadingText != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: textColor ?? theme.primaryColorLight,
                          strokeWidth: 2,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        loadingText ?? "",
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: textColor ??
                              (allowSubmit ? Colors.white : Colors.black),
                        ),
                      ),
                    ],
                  )
                : Text(
                    title,
                    style: theme.textTheme.labelLarge,
                  ),
          ),
        ),
      ),
    );
  }
}
