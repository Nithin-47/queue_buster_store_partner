

import 'package:flutter/material.dart';
import 'package:queue_buster_store_partner/widgets/switch.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Online/Offline'),
                SwitchExample(),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.black,
                    height: 1.5,
                    width: 1.5,
                  ),
                ),
                const Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      'Orders',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.black,
                    height: 1.5,
                    width: 1.5,
                  ),
                ),
              ],
            ),
          ),


        ],
      )





    );
  }
}
