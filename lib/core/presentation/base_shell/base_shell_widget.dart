import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseShellWidget extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final Widget child;

  const BaseShellWidget({super.key, required this.navigationShell, required this.child});

  void _selectTab(int index, BuildContext context) {
    navigationShell.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => _selectTab(index, context),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Bookings'),
        ],
      ),
    );
  }
}
