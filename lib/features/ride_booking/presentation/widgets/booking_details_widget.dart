import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingDetailsCard extends StatelessWidget {
  final String? pickupAddress;
  final String? destinationAddress;
  final int? passengerCount;
  final DateTime? dateTime;

  const BookingDetailsCard({
    super.key,
    this.pickupAddress,
    this.destinationAddress,
    this.passengerCount,
    this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border.all(color: theme.dividerColor),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pickup: $pickupAddress', style: theme.textTheme.bodyMedium),
            const SizedBox(height: 8),
            Text('Destination: $destinationAddress', style: theme.textTheme.bodyMedium),
            const SizedBox(height: 8),
            Text('Passengers: $passengerCount', style: theme.textTheme.bodyMedium),
            const SizedBox(height: 8),
            if (dateTime != null)
              Text(
                'Date: ${DateFormat('MMMM d, y HH:mm').format(dateTime!)}',
                style: theme.textTheme.bodyMedium,
              ),
          ],
        ),
      ),
    );
  }
}
