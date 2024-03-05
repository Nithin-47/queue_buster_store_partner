import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:queue_buster_store_partner/constants/route_names.dart';

class ConsumerLayout extends StatefulWidget {
  final Widget child;

  const ConsumerLayout({super.key, required this.child});

  @override
  State<ConsumerLayout> createState() => _ConsumerLayoutState();
}

class _ConsumerLayoutState extends State<ConsumerLayout> {
  int myindex = 0;

  List<NavBarItems> navBarItems = [
    NavBarItems(
      label: "Orders",
      icon: const Icon(Icons.store_outlined),
      selectedIcon: const Icon(Icons.home),
      path: RouteNames.home.path,
    ),
    NavBarItems(
      label: "Menu",
      icon: const Icon(Icons.menu_book_outlined),
      selectedIcon: const Icon(Icons.menu_book),
      path: RouteNames.menu.path,
    ),
    NavBarItems(
      label: "More",
      icon: const Icon(Icons.more_outlined),
      selectedIcon: const Icon(Icons.more),
      path: RouteNames.more.path,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: myindex,
        onDestinationSelected: (index) {
          setState(() {
            myindex = index;
          });

          final path = navBarItems[index].path;
          context.go(path);
        },
        destinations: navBarItems.map((item) => (
          NavigationDestination(
            selectedIcon: item.selectedIcon,
            icon: item.icon,
            label: item.label,
          )
        )).toList()
      ),
    );
  }
}

class NavBarItems {
  final String label;
  final Icon icon;
  final Icon selectedIcon;
  final String path;

  const NavBarItems({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.path,
  });
}

// class ScaffoldWithNavBar extends StatelessWidget {
//   /// Constructs an [ScaffoldWithNavBar].
//   const ScaffoldWithNavBar({
//     required this.navigationShell,
//     required this.children
//     Key? key,
//   }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));
//
//   /// The navigation shell and container for the branch Navigators.
//   final StatefulNavigationShell navigationShell;
//   final List<Widget> children;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BranchNavi,
//       bottomNavigationBar: NavigationBar(
//
//         destinations: const [
//           NavigationDestination(
//               selectedIcon: Icon(Icons.store),
//               icon: Icon(Icons.store_outlined),
//               label: "Orders"),
//           NavigationDestination(
//               selectedIcon: Icon(Icons.menu_book),
//               icon: Icon(Icons.menu_book_outlined),
//               label: "Menu"),
//           NavigationDestination(
//               selectedIcon: Icon(Icons.more),
//               icon: Icon(Icons.more_outlined),
//               label: "More"),
//           // NavigationDestination(
//           //     selectedIcon: Icon(Icons.settings),
//           //     icon: Icon(Icons.settings_outlined),
//           //     label: "Settings"),
//
//         ],
//         selectedIndex: navigationShell.currentIndex,
//         onDestinationSelected: (int index) => _onTap(context, index),
//       ),
//     );
//   }
//
//   /// Navigate to the current location of the branch at the provided index when
//   /// tapping an item in the BottomNavigationBar.
//   void _onTap(BuildContext context, int index) {
//     // When navigating to a new branch, it's recommended to use the goBranch
//     // method, as doing so makes sure the last navigation state of the
//     // Navigator for the branch is restored.
//     navigationShell.goBranch(
//       index,
//       // A common pattern when using bottom navigation bars is to support
//       // navigating to the initial location when tapping the item that is
//       // already active. This example demonstrates how to support this behavior,
//       // using the initialLocation parameter of goBranch.
//
//       // initialLocation: index == navigationShell.currentIndex,
//       initialLocation: true
//     );
//   }
// }
