

import 'package:flutter/material.dart';
import 'package:queue_buster_store_partner/widgets/switch.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: const AssetImage('Assets/login.png'),
              radius: 120,
            ),
            Text('Menu'),
            Row(
              children: [
                Text('Online/Offline'),
                SwitchExample(),
              ],
            )
          ],
        ),
      ),





    );
  }
}
