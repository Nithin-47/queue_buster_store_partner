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
          Padding(
            padding: const EdgeInsets.only(top: 28.0, bottom: 8),
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
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(18),
              itemCount: 5,
              itemBuilder: (BuildContext context, int i) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ovhay',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxHeight: 1000,
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                              physics: RangeMaintainingScrollPhysics(),
                              itemCount: 10,
                              itemBuilder: (context, i) => const Text("lol")
                          )
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                                onPressed: () {}, child: const Text("Approve")),
                            TextButton(
                                onPressed: () {}, child: const Text("Reject"))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ]));
  }
}

// ListView.builder(
// padding: const EdgeInsets.all(8),
// itemCount: 2,
// itemBuilder: (BuildContext context, int i) {
// return const ListTile(
//
// leading: Text('Put the ordered Item here'),
// );
//
// }),