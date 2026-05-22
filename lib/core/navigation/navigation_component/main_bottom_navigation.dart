import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobeen/core/services/user_service.dart';

class MainBottomNavigation extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainBottomNavigation({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    final role = GetIt.I<UserService>().getUser!.role;

    final items = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: '',
      ),

      const BottomNavigationBarItem(
        icon: Icon(Icons.assignment),
        label: '',
      ),

      BottomNavigationBarItem(
        icon: Icon(
          role == 'supervisor'
              ? Icons.location_on
              : role == 'researcher'
                  ? Icons.translate
                  : Icons.download,
        ),
        label: '',
      ),
    ];

    // supervisor only
    if (role == 'supervisor') {
      items.add(
        const BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: '',
        ),
      );
    }

    items.add(
      const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: '',
      ),
    );

    int currentIndex = navigationShell.currentIndex;

    // profile branch = 4
    // visible profile tab = 3
    if (role != 'supervisor' &&
        navigationShell.currentIndex == 4) {
      currentIndex = 3;
    }

    return Scaffold(
      body: navigationShell,

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          int branchIndex = index;

          if (role != 'supervisor' &&
              index == 3) {
            branchIndex = 4;
          }

          navigationShell.goBranch(
            branchIndex,
            initialLocation: true,
          );
        },

        items: items,
      ),
    );
  }
}