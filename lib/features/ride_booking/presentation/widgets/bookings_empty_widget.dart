import 'package:flutter/material.dart';

class BookingsEmptyWidget extends StatelessWidget {
  const BookingsEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('No bookings yet', style: Theme.of(context).textTheme.titleSmall));
  }
}
