import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

abstract final class DialogService {
  DialogService._();

  static void showFlushBar({
    required BuildContext context,
    required String message,
    FlushbarPosition position = FlushbarPosition.BOTTOM,
    EdgeInsets? margin,
    Color? backgroundColor,
  }) {
    final theme = Theme.of(context);
    Flushbar(
      animationDuration: const Duration(milliseconds: 400),
      flushbarPosition: position,
      margin: margin ?? const EdgeInsets.all(4),
      backgroundColor: backgroundColor ?? theme.primaryColor,
      borderRadius: BorderRadius.circular(12),
      messageText: Text(
        message,
        style: theme.textTheme.labelSmall!.copyWith(color: theme.scaffoldBackgroundColor),
      ),
      duration: const Duration(seconds: 4),
    )
      ..dismiss()
      ..show(context);
  }

  static void showErrorFlushBar({
    required BuildContext context,
    required String message,
    FlushbarPosition position = FlushbarPosition.BOTTOM,
    EdgeInsets? margin,
    Color? backgroundColor,
  }) {
    final theme = Theme.of(context);
    Flushbar(
      animationDuration: const Duration(milliseconds: 400),
      flushbarPosition: position,
      margin: margin ?? const EdgeInsets.all(4),
      backgroundColor: backgroundColor ?? theme.colorScheme.error,
      borderRadius: BorderRadius.circular(12),
      messageText: Text(
        message,
        style: theme.textTheme.labelSmall!.copyWith(color: theme.scaffoldBackgroundColor),
      ),
      duration: const Duration(seconds: 4),
    )
      ..dismiss()
      ..show(context);
  }

  static Future<DateTime?> selectDateTime({
    required BuildContext context,
    DateTime? initialDate,
  }) async {
    final DateTime now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? now,
      firstDate: now,
      lastDate: DateTime(now.year + 1),
    );

    if (pickedDate != null) {
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate ?? now),
      );

      if (pickedTime != null) {
        return DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      }
    }
    return null;
  }

}
