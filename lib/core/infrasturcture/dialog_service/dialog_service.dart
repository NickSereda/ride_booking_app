import 'package:flutter/material.dart';

abstract final class DialogService {
  DialogService._();

  static void showSnackBar({
    required BuildContext context,
    required String message,
    Color? backgroundColor,
  }) {
    final theme = Theme.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: backgroundColor ?? theme.primaryColorLight, content: Text(message)),
    );
  }

  static void showErrorSnackBar({
    required BuildContext context,
    required String message,
    Color? backgroundColor,
  }) {
    final theme = Theme.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor ?? theme.colorScheme.error,
        content: Text(
          message,
          style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onError),
        ),
      ),
    );
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
      if (context.mounted) {
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
    }
    return null;
  }
}
