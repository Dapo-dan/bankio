// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:bankio/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputForm extends StatefulWidget {
  const TextInputForm({
    super.key,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.obscure = false,
    this.onChanged,
    this.onSubmit,
    this.enabled = true,
    this.controller,
    this.errorText,
    this.label,
    this.hint,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    this.keyboardType,
    this.maxLength,
    this.inputFormatters,
    this.prefixText,
    this.onTap,
  });

  final suffixIcon;
  final prefixIcon;
  final onChanged;
  final onSubmit;
  final validator;
  final bool enabled;
  final TextEditingController? controller;
  final bool obscure;
  final String? label, errorText;
  final String? prefixText;
  final String? hint;
  final TextCapitalization textCapitalization;
  final keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? maxLength;
  final Function()? onTap;

  @override
  State<TextInputForm> createState() => _TextInputFormState();
}

class _TextInputFormState extends State<TextInputForm> {
  bool showpassword = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            Text(
              widget.label!,
              style: theme.textTheme.bodySmall,
            ),
          verticalSpaceSmall(),
          InkWell(
            onTap: widget.onTap,
            child: TextFormField(
              buildCounter: (context,
                      {required currentLength,
                      required isFocused,
                      maxLength}) =>
                  null,
              inputFormatters: widget.inputFormatters,
              enabled: widget.enabled,
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              style: theme.textTheme.bodyMedium,
              textCapitalization: widget.textCapitalization,
              validator: widget.validator,
              onChanged: widget.onChanged,
              onFieldSubmitted: widget.onSubmit,
              obscureText: widget.obscure ? showpassword : false,
              obscuringCharacter: '*',
              maxLines: widget.maxLines,
              maxLength: widget.maxLength,
              cursorColor: theme.primaryColor,
              decoration: InputDecoration(
                errorText: widget.errorText,
                errorStyle: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.error,
                ),
                filled: true,
                fillColor: theme.colorScheme.onPrimaryContainer,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: theme.colorScheme.primaryContainer,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: theme.colorScheme.primaryContainer,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: theme.primaryColor,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: theme.colorScheme.error,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: theme.colorScheme.primaryContainer,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      24,
                    ),
                  ),
                ),
                suffixIcon: widget.suffixIcon ??
                    (widget.obscure == true
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                showpassword = !showpassword;
                              });
                            },
                            child: Icon(
                              showpassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                          )
                        : const SizedBox()),
                prefixIcon: widget.prefixIcon,
                hintText: widget.hint,
                prefixText: widget.prefixText,
                hintStyle: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.primaryContainer,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
