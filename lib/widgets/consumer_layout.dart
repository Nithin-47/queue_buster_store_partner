import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// class ConsumerLayout extends StatefulWidget {
//   final Widget child;
//
//   const ConsumerLayout({super.key, required this.child});
//
//   @override
//   State<ConsumerLayout> createState() => _ConsumerLayoutState();
// }
//
// class _ConsumerLayoutState extends State<ConsumerLayout> {
//   int myindex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: widget.child,
//       bottomNavigationBar: NavigationBar(
//
//         selectedIndex: myindex,
//         onDestinationSelected: (index) {
//           setState(() {
//             myindex = index;
//           });
//         },
//         destinations: const [
//           NavigationDestination(
//               selectedIcon: Icon(Icons.home),
//               icon: Icon(Icons.home_outlined),
//               label: "Home"),
//           NavigationDestination(
//               selectedIcon: Icon(Icons.store),
//               icon: Icon(Icons.store_outlined),
//               label: "Stores"),
//           NavigationDestination(
//               selectedIcon: Icon(Icons.shopping_cart),
//               icon: Icon(Icons.shopping_cart_outlined),
//               label: "Cart"),
//
//         ],
//       ),
//     );
//   }
// }



class ScaffoldWithNavBar extends StatelessWidget {
  /// Constructs an [ScaffoldWithNavBar].
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(

        destinations: const [
          NavigationDestination(
              selectedIcon: Icon(Icons.store),
              icon: Icon(Icons.store_outlined),
              label: "Orders"),
          NavigationDestination(
              selectedIcon: Icon(Icons.menu_book),
              icon: Icon(Icons.menu_book_outlined),
              label: "Menu"),
          NavigationDestination(
              selectedIcon: Icon(Icons.more),
              icon: Icon(Icons.more_outlined),
              label: "More"),
          // NavigationDestination(
          //     selectedIcon: Icon(Icons.settings),
          //     icon: Icon(Icons.settings_outlined),
          //     label: "Settings"),

        ],
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (int index) => _onTap(context, index),
      ),
    );
  }

  /// Navigate to the current location of the branch at the provided index when
  /// tapping an item in the BottomNavigationBar.
  void _onTap(BuildContext context, int index) {
    // When navigating to a new branch, it's recommended to use the goBranch
    // method, as doing so makes sure the last navigation state of the
    // Navigator for the branch is restored.
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.

      // initialLocation: index == navigationShell.currentIndex,
      initialLocation: true
    );
  }
}
