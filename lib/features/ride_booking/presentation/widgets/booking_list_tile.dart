import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingListTile extends StatelessWidget {
  final String pickupAddress;
  final String destinationAddress;
  final DateTime dateTime;

  const BookingListTile({
    super.key,
    required this.pickupAddress,
    required this.destinationAddress,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: theme.dividerColor),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          title: Text('From: $pickupAddress'),
          subtitle: Text('To: $destinationAddress'),
          trailing: Text(
            DateFormat('MMMM d, y HH:mm').format(dateTime),
            style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface),
          ),
        ),
      ),
    );
  }
}
